with import <nixpkgs> {};

let
  remacsSource = import ./remacs-source.nix { local = false; };
  remacs = import ./remacs.nix { remacsSource = remacsSource; } ;
  customEmacs = emacsPackagesNg.overrideScope' (self: super: {
    emacs = remacs;
  });
  packages = import ./packages.nix {};
in

customEmacs.emacsWithPackages packages
