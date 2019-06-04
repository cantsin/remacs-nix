with import <nixpkgs> {};

let lib = import <nixpkgs/lib>;
in

let src = fetchFromGitHub {
      owner = "mozilla";
      repo = "nixpkgs-mozilla";
      rev = "50bae918794d3c283aeb335b209efd71e75e3954";
      sha256 = "07b7hgq5awhddcii88y43d38lncqq9c8b2px4p93r5l7z0phv89d";
      # date = 2019-04-02T09:39:52+02:00;
   };
in

with import "${src.out}/rust-overlay.nix" pkgs pkgs;

let rust = (rustChannelOf { date = "2019-05-01"; channel = "nightly"; }).rust;
in

let cargoPackages = (import ./Cargo.nix).__all;
in

let remacs = stdenv.mkDerivation rec {
  name = "remacs";
  version = "dev";

  # prefer our local copy for ease of debugging
  src = if lib.pathExists ./remacs then
    ./remacs
  else fetchFromGitHub {
    owner = "remacs";
    repo = "remacs";
    rev = "8d939e72e48ba54f48994a5a47fbe7d12c71ef97";
    sha256 = "0gcbxnhjbxd5jv8ghmwlacnhp7qrgmnakljqgb6mf3911jziq0cb";
    # date = 2019-05-29T14:52:19+02:00;
  };

  enableParallelBuilding = true;

  buildInputs = [
    rust systemd texinfo libjpeg libtiff giflib xorg.libXpm gtk3
    gnutls ncurses libxml2 xorg.libXt imagemagick librsvg gpm dbus
    libotf pkgconfig autoconf clang llvmPackages.libclang git
  ]
  # ++ cargoPackages
  ;

  patches = [./autogen-sh-0001.patch];

  postPatch = ''
    pwd="$(type -P pwd)"
    substituteInPlace Makefile.in --replace "/bin/pwd" "$pwd"
    substituteInPlace lib-src/Makefile.in --replace "/bin/pwd" "$pwd"
  '';

  preConfigure = ''
    ./autogen.sh
  '';

  # TODO: handle cargo dependencies properly
  postConfigure = ''
    export HOME=$TMP;
    mkdir $TMP/.cargo;
    cat ${./config} | sed "s|TMP|$TMP|" > $TMP/.cargo/config;
    cp -r ${./vendor} $TMP/vendor;
  '';

  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  # point Cargo to /tmp instead
  preBuild = ''
    export HOME=$TMP;
  '';

  makeFlags = [
    "CARGO_FLAGS=-Zoffline" # soon --offline
  ];

  configureFlags = [
    "--enable-rust-debug"
  ];

  # the nixpkgs emacs wrapper requires these paths to be present
  postInstall = ''
    ln -s $out/bin/remacs $out/bin/emacs
    ln -s $out/bin/remacsclient $out/bin/emacsclient
    ln -s $out/share/remacs $out/share/emacs

    mkdir -p $out/share/emacs/site-lisp
    cp ${./site-start.el} $out/share/emacs/site-lisp/site-start.el
    $out/bin/emacs --batch -f batch-byte-compile $out/share/emacs/site-lisp/site-start.el
  '';

  meta = {
    homepage = "https://github.com/remacs/remacs";
    description = "A community-driven port of Emacs to Rust.";
    platforms = with stdenv.lib.platforms; unix;
  };
};
in

let
  customEmacsPackages = emacsPackagesNg.overrideScope' (self: super: {
    emacs = remacs;
  });
  packages = import ./packages.nix {};
in

customEmacsPackages.emacsWithPackages packages
