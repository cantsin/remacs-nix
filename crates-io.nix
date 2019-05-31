{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_.adler32."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    description = "Minimal Adler32 implementation for Rust.";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_.adler32."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
# aho-corasick-0.6.9

  crates.aho_corasick."0.6.9" = deps: { features?(features_.aho_corasick."0.6.9" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.6.9";
    description = "Fast multiple substring searching with finite state machines.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1lj20py6bvw3y7m9n2nqh0mkshfl1kjfp72lfika9gpkrp2r204l";
    libName = "aho_corasick";
    crateBin =
      [{  name = "aho-corasick-dot";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.6.9"."memchr"}" deps)
    ]);
  };
  features_.aho_corasick."0.6.9" = deps: f: updateFeatures f (rec {
    aho_corasick."0.6.9".default = (f.aho_corasick."0.6.9".default or true);
    memchr."${deps.aho_corasick."0.6.9".memchr}".default = true;
  }) [
    (features_.memchr."${deps."aho_corasick"."0.6.9"."memchr"}" deps)
  ];


# end
# autocfg-0.1.2

  crates.autocfg."0.1.2" = deps: { features?(features_.autocfg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.2";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0dv81dwnp1al3j4ffz007yrjv4w1c7hw09gnf0xs3icxiw6qqfs3";
  };
  features_.autocfg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."0.1.2".default = (f.autocfg."0.1.2".default or true);
  }) [];


# end
# base64-0.10.1

  crates.base64."0.10.1" = deps: { features?(features_.base64."0.10.1" deps {}) }: buildRustCrate {
    crateName = "base64";
    version = "0.10.1";
    description = "encodes and decodes base64 as bytes or utf8";
    authors = [ "Alice Maz <alice@alicemaz.com>" "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1zz3jq619hahla1f70ra38818b5n8cp4iilij81i90jq6z7hlfhg";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."base64"."0.10.1"."byteorder"}" deps)
    ]);
  };
  features_.base64."0.10.1" = deps: f: updateFeatures f (rec {
    base64."0.10.1".default = (f.base64."0.10.1".default or true);
    byteorder."${deps.base64."0.10.1".byteorder}".default = true;
  }) [
    (features_.byteorder."${deps."base64"."0.10.1"."byteorder"}" deps)
  ];


# end
# bitflags-1.0.4

  crates.bitflags."1.0.4" = deps: { features?(features_.bitflags."1.0.4" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.4";
    description = "A macro to generate structures which behave like bitflags.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1g1wmz2001qmfrd37dnd5qiss5njrw26aywmg6yhkmkbyrhjxb08";
    features = mkFeatures (features."bitflags"."1.0.4" or {});
  };
  features_.bitflags."1.0.4" = deps: f: updateFeatures f (rec {
    bitflags."1.0.4".default = (f.bitflags."1.0.4".default or true);
  }) [];


# end
# block-buffer-0.7.2

  crates.block_buffer."0.7.2" = deps: { features?(features_.block_buffer."0.7.2" deps {}) }: buildRustCrate {
    crateName = "block-buffer";
    version = "0.7.2";
    description = "Fixed size buffer for block processing of data";
    authors = [ "RustCrypto Developers" ];
    sha256 = "1w9k4clyz988g96hb7m3yx2yapz3251rzwjbbfxn0fczcd33haj4";
    dependencies = mapFeatures features ([
      (crates."block_padding"."${deps."block_buffer"."0.7.2"."block_padding"}" deps)
      (crates."byte_tools"."${deps."block_buffer"."0.7.2"."byte_tools"}" deps)
      (crates."byteorder"."${deps."block_buffer"."0.7.2"."byteorder"}" deps)
      (crates."generic_array"."${deps."block_buffer"."0.7.2"."generic_array"}" deps)
    ]);
  };
  features_.block_buffer."0.7.2" = deps: f: updateFeatures f (rec {
    block_buffer."0.7.2".default = (f.block_buffer."0.7.2".default or true);
    block_padding."${deps.block_buffer."0.7.2".block_padding}".default = true;
    byte_tools."${deps.block_buffer."0.7.2".byte_tools}".default = true;
    byteorder."${deps.block_buffer."0.7.2".byteorder}".default = (f.byteorder."${deps.block_buffer."0.7.2".byteorder}".default or false);
    generic_array."${deps.block_buffer."0.7.2".generic_array}".default = true;
  }) [
    (features_.block_padding."${deps."block_buffer"."0.7.2"."block_padding"}" deps)
    (features_.byte_tools."${deps."block_buffer"."0.7.2"."byte_tools"}" deps)
    (features_.byteorder."${deps."block_buffer"."0.7.2"."byteorder"}" deps)
    (features_.generic_array."${deps."block_buffer"."0.7.2"."generic_array"}" deps)
  ];


# end
# block-padding-0.1.3

  crates.block_padding."0.1.3" = deps: { features?(features_.block_padding."0.1.3" deps {}) }: buildRustCrate {
    crateName = "block-padding";
    version = "0.1.3";
    description = "Padding and unpadding of messages divided into blocks.";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0215kqxwgs5bzrpykg86wz3ix77lnci666b724dxb0iln91ch2ag";
    dependencies = mapFeatures features ([
      (crates."byte_tools"."${deps."block_padding"."0.1.3"."byte_tools"}" deps)
    ]);
  };
  features_.block_padding."0.1.3" = deps: f: updateFeatures f (rec {
    block_padding."0.1.3".default = (f.block_padding."0.1.3".default or true);
    byte_tools."${deps.block_padding."0.1.3".byte_tools}".default = true;
  }) [
    (features_.byte_tools."${deps."block_padding"."0.1.3"."byte_tools"}" deps)
  ];


# end
# build_const-0.2.1

  crates.build_const."0.2.1" = deps: { features?(features_.build_const."0.2.1" deps {}) }: buildRustCrate {
    crateName = "build_const";
    version = "0.2.1";
    description = "library for creating importable constants from build.rs or a script";
    authors = [ "Garrett Berg <vitiral@gmail.com>" ];
    sha256 = "15249xzi3qlm72p4glxgavwyq70fx2sp4df6ii0sdlrixrrp77pl";
    features = mkFeatures (features."build_const"."0.2.1" or {});
  };
  features_.build_const."0.2.1" = deps: f: updateFeatures f (rec {
    build_const = fold recursiveUpdate {} [
      { "0.2.1"."std" =
        (f.build_const."0.2.1"."std" or false) ||
        (f.build_const."0.2.1".default or false) ||
        (build_const."0.2.1"."default" or false); }
      { "0.2.1".default = (f.build_const."0.2.1".default or true); }
    ];
  }) [];


# end
# byte-tools-0.3.1

  crates.byte_tools."0.3.1" = deps: { features?(features_.byte_tools."0.3.1" deps {}) }: buildRustCrate {
    crateName = "byte-tools";
    version = "0.3.1";
    description = "Bytes related utility functions";
    authors = [ "RustCrypto Developers" ];
    sha256 = "01hfp59bxq74glhfmhvm9wma2migq2kfmvcvqq5pssk5k52g8ja0";
  };
  features_.byte_tools."0.3.1" = deps: f: updateFeatures f (rec {
    byte_tools."0.3.1".default = (f.byte_tools."0.3.1".default or true);
  }) [];


# end
# byteorder-1.3.1

  crates.byteorder."1.3.1" = deps: { features?(features_.byteorder."1.3.1" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.1";
    description = "Library for reading/writing numbers in big-endian and little-endian.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1dd46l7fvmxfq90kh6ip1ghsxzzcdybac8f0mh2jivsdv9vy8k4w";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.1" or {});
  };
  features_.byteorder."1.3.1" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.1"."std" =
        (f.byteorder."1.3.1"."std" or false) ||
        (f.byteorder."1.3.1".default or false) ||
        (byteorder."1.3.1"."default" or false); }
      { "1.3.1".default = (f.byteorder."1.3.1".default or true); }
    ];
  }) [];


# end
# bytesize-0.1.3

  crates.bytesize."0.1.3" = deps: { features?(features_.bytesize."0.1.3" deps {}) }: buildRustCrate {
    crateName = "bytesize";
    version = "0.1.3";
    description = "ByteSize is an utility that easily makes bytes size representation and helps its arithmetic operations.";
    authors = [ "Hyunsik Choi <hyunsik.choi at gmail dot com>" ];
    sha256 = "06ih271y5z6dp1zswka3j14qg4s5d13vfjv660yvlm1gqq66ig2f";
  };
  features_.bytesize."0.1.3" = deps: f: updateFeatures f (rec {
    bytesize."0.1.3".default = (f.bytesize."0.1.3".default or true);
  }) [];


# end
# cc-1.0.28

  crates.cc."1.0.28" = deps: { features?(features_.cc."1.0.28" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.28";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "07harxg2cjw75qvnq637z088w9qaa0hgj0nmcm6yh9in8m2swl19";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.28" or {});
  };
  features_.cc."1.0.28" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.28"."rayon" =
        (f.cc."1.0.28"."rayon" or false) ||
        (f.cc."1.0.28".parallel or false) ||
        (cc."1.0.28"."parallel" or false); }
      { "1.0.28".default = (f.cc."1.0.28".default or true); }
    ];
  }) [];


# end
# cfg-if-0.1.6

  crates.cfg_if."0.1.6" = deps: { features?(features_.cfg_if."0.1.6" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.6";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "11qrix06wagkplyk908i3423ps9m9np6c4vbcq81s9fyl244xv3n";
  };
  features_.cfg_if."0.1.6" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.6".default = (f.cfg_if."0.1.6".default or true);
  }) [];


# end
# chrono-0.4.6

  crates.chrono."0.4.6" = deps: { features?(features_.chrono."0.4.6" deps {}) }: buildRustCrate {
    crateName = "chrono";
    version = "0.4.6";
    description = "Date and time library for Rust";
    authors = [ "Kang Seonghoon <public+rust@mearie.org>" "Brandon W Maister <quodlibetor@gmail.com>" ];
    sha256 = "0cxgqgf4lknsii1k806dpmzapi2zccjpa350ns5wpb568mij096x";
    dependencies = mapFeatures features ([
      (crates."num_integer"."${deps."chrono"."0.4.6"."num_integer"}" deps)
      (crates."num_traits"."${deps."chrono"."0.4.6"."num_traits"}" deps)
    ]
      ++ (if features.chrono."0.4.6".time or false then [ (crates.time."${deps."chrono"."0.4.6".time}" deps) ] else []));
    features = mkFeatures (features."chrono"."0.4.6" or {});
  };
  features_.chrono."0.4.6" = deps: f: updateFeatures f (rec {
    chrono = fold recursiveUpdate {} [
      { "0.4.6"."clock" =
        (f.chrono."0.4.6"."clock" or false) ||
        (f.chrono."0.4.6".default or false) ||
        (chrono."0.4.6"."default" or false); }
      { "0.4.6"."time" =
        (f.chrono."0.4.6"."time" or false) ||
        (f.chrono."0.4.6".clock or false) ||
        (chrono."0.4.6"."clock" or false); }
      { "0.4.6".default = (f.chrono."0.4.6".default or true); }
    ];
    num_integer."${deps.chrono."0.4.6".num_integer}".default = (f.num_integer."${deps.chrono."0.4.6".num_integer}".default or false);
    num_traits."${deps.chrono."0.4.6".num_traits}".default = (f.num_traits."${deps.chrono."0.4.6".num_traits}".default or false);
    time."${deps.chrono."0.4.6".time}".default = true;
  }) [
    (features_.num_integer."${deps."chrono"."0.4.6"."num_integer"}" deps)
    (features_.num_traits."${deps."chrono"."0.4.6"."num_traits"}" deps)
    (features_.time."${deps."chrono"."0.4.6"."time"}" deps)
  ];


# end
# clippy-0.0.302

  crates.clippy."0.0.302" = deps: { features?(features_.clippy."0.0.302" deps {}) }: buildRustCrate {
    crateName = "clippy";
    version = "0.0.302";
    description = "A bunch of helpful lints to avoid common pitfalls in Rust.";
    authors = [ "Manish Goregaokar <manishsmail@gmail.com>" ];
    edition = "2018";
    sha256 = "0hpwcs2z5m98jcn012mjj66k04ji1vrkzihc8kz24f4adp3pa53q";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."term"."${deps."clippy"."0.0.302"."term"}" deps)
    ]);
  };
  features_.clippy."0.0.302" = deps: f: updateFeatures f (rec {
    clippy."0.0.302".default = (f.clippy."0.0.302".default or true);
    term."${deps.clippy."0.0.302".term}".default = true;
  }) [
    (features_.term."${deps."clippy"."0.0.302"."term"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    description = "Low level interface to CloudABI. Contains all syscalls and related types.";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3"."bitflags" =
        (f.cloudabi."0.0.3"."bitflags" or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# crc-1.8.1

  crates.crc."1.8.1" = deps: { features?(features_.crc."1.8.1" deps {}) }: buildRustCrate {
    crateName = "crc";
    version = "1.8.1";
    description = "Rust implementation of CRC(16, 32, 64) with support of various standards";
    authors = [ "Rui Hu <code@mrhooray.com>" ];
    sha256 = "00m9jjqrddp3bqyanvyxv0hf6s56bx1wy51vcdcxg4n2jdhg109s";

    buildDependencies = mapFeatures features ([
      (crates."build_const"."${deps."crc"."1.8.1"."build_const"}" deps)
    ]);
    features = mkFeatures (features."crc"."1.8.1" or {});
  };
  features_.crc."1.8.1" = deps: f: updateFeatures f (rec {
    build_const."${deps.crc."1.8.1".build_const}".default = true;
    crc = fold recursiveUpdate {} [
      { "1.8.1"."std" =
        (f.crc."1.8.1"."std" or false) ||
        (f.crc."1.8.1".default or false) ||
        (crc."1.8.1"."default" or false); }
      { "1.8.1".default = (f.crc."1.8.1".default or true); }
    ];
  }) [
    (features_.build_const."${deps."crc"."1.8.1"."build_const"}" deps)
  ];


# end
# crc32fast-1.1.2

  crates.crc32fast."1.1.2" = deps: { features?(features_.crc32fast."1.1.2" deps {}) }: buildRustCrate {
    crateName = "crc32fast";
    version = "1.1.2";
    description = "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation";
    authors = [ "Sam Rijs <srijs@airpost.net>" "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "19hjgifwvsgcvhm7f6bqkp4sfijnx3ddiv8szdfwjn3sjn4lysd6";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crc32fast"."1.1.2"."cfg_if"}" deps)
    ]);
  };
  features_.crc32fast."1.1.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.1.2".cfg_if}".default = true;
    crc32fast."1.1.2".default = (f.crc32fast."1.1.2".default or true);
  }) [
    (features_.cfg_if."${deps."crc32fast"."1.1.2"."cfg_if"}" deps)
  ];


# end
# darling-0.2.2

  crates.darling."0.2.2" = deps: { features?(features_.darling."0.2.2" deps {}) }: buildRustCrate {
    crateName = "darling";
    version = "0.2.2";
    description = "A proc-macro library for reading attributes into structs when\nimplementing custom derives.\n";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "07zirqam1ksa9jwd7vmapkhffkzhn0rmm1ywzg758wjmga41nyjm";
    dependencies = mapFeatures features ([
      (crates."darling_core"."${deps."darling"."0.2.2"."darling_core"}" deps)
      (crates."darling_macro"."${deps."darling"."0.2.2"."darling_macro"}" deps)
    ]);
  };
  features_.darling."0.2.2" = deps: f: updateFeatures f (rec {
    darling."0.2.2".default = (f.darling."0.2.2".default or true);
    darling_core."${deps.darling."0.2.2".darling_core}".default = true;
    darling_macro."${deps.darling."0.2.2".darling_macro}".default = true;
  }) [
    (features_.darling_core."${deps."darling"."0.2.2"."darling_core"}" deps)
    (features_.darling_macro."${deps."darling"."0.2.2"."darling_macro"}" deps)
  ];


# end
# darling_core-0.2.2

  crates.darling_core."0.2.2" = deps: { features?(features_.darling_core."0.2.2" deps {}) }: buildRustCrate {
    crateName = "darling_core";
    version = "0.2.2";
    description = "Helper crate for proc-macro library for reading attributes into structs when\nimplementing custom derives. Use https://crates.io/crates/darling in your code.\n";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "1gzqjc89g5xfp0mpiq4r5pk9wh4qf4w5ids5d37z5745glb4lz72";
    dependencies = mapFeatures features ([
      (crates."ident_case"."${deps."darling_core"."0.2.2"."ident_case"}" deps)
      (crates."lazy_static"."${deps."darling_core"."0.2.2"."lazy_static"}" deps)
      (crates."quote"."${deps."darling_core"."0.2.2"."quote"}" deps)
      (crates."syn"."${deps."darling_core"."0.2.2"."syn"}" deps)
    ]);
  };
  features_.darling_core."0.2.2" = deps: f: updateFeatures f (rec {
    darling_core."0.2.2".default = (f.darling_core."0.2.2".default or true);
    ident_case."${deps.darling_core."0.2.2".ident_case}".default = true;
    lazy_static."${deps.darling_core."0.2.2".lazy_static}".default = true;
    quote."${deps.darling_core."0.2.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.darling_core."0.2.2".syn}"."full" =
        (f.syn."${deps.darling_core."0.2.2".syn}"."full" or false) ||
        (darling_core."0.2.2"."default" or false) ||
        (f."darling_core"."0.2.2"."default" or false); }
      { "${deps.darling_core."0.2.2".syn}".default = true; }
    ];
  }) [
    (features_.ident_case."${deps."darling_core"."0.2.2"."ident_case"}" deps)
    (features_.lazy_static."${deps."darling_core"."0.2.2"."lazy_static"}" deps)
    (features_.quote."${deps."darling_core"."0.2.2"."quote"}" deps)
    (features_.syn."${deps."darling_core"."0.2.2"."syn"}" deps)
  ];


# end
# darling_macro-0.2.2

  crates.darling_macro."0.2.2" = deps: { features?(features_.darling_macro."0.2.2" deps {}) }: buildRustCrate {
    crateName = "darling_macro";
    version = "0.2.2";
    description = "Internal support for a proc-macro library for reading attributes into structs when\nimplementing custom derives. Use https://crates.io/crates/darling in your code.\n";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "1xck2fl9fp97d2waij4pn3cr3g3a59mx3vfzw28zwdd2cw5fs5fq";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."darling_core"."${deps."darling_macro"."0.2.2"."darling_core"}" deps)
      (crates."quote"."${deps."darling_macro"."0.2.2"."quote"}" deps)
      (crates."syn"."${deps."darling_macro"."0.2.2"."syn"}" deps)
    ]);
  };
  features_.darling_macro."0.2.2" = deps: f: updateFeatures f (rec {
    darling_core."${deps.darling_macro."0.2.2".darling_core}".default = true;
    darling_macro."0.2.2".default = (f.darling_macro."0.2.2".default or true);
    quote."${deps.darling_macro."0.2.2".quote}".default = true;
    syn."${deps.darling_macro."0.2.2".syn}".default = true;
  }) [
    (features_.darling_core."${deps."darling_macro"."0.2.2"."darling_core"}" deps)
    (features_.quote."${deps."darling_macro"."0.2.2"."quote"}" deps)
    (features_.syn."${deps."darling_macro"."0.2.2"."syn"}" deps)
  ];


# end
# digest-0.8.0

  crates.digest."0.8.0" = deps: { features?(features_.digest."0.8.0" deps {}) }: buildRustCrate {
    crateName = "digest";
    version = "0.8.0";
    description = "Traits for cryptographic hash functions";
    authors = [ "RustCrypto Developers" ];
    sha256 = "1bsddd8vdmncmprks8b392yccf132wjwzrcy5wdy1kh05qm23il8";
    dependencies = mapFeatures features ([
      (crates."generic_array"."${deps."digest"."0.8.0"."generic_array"}" deps)
    ]);
    features = mkFeatures (features."digest"."0.8.0" or {});
  };
  features_.digest."0.8.0" = deps: f: updateFeatures f (rec {
    digest = fold recursiveUpdate {} [
      { "0.8.0"."blobby" =
        (f.digest."0.8.0"."blobby" or false) ||
        (f.digest."0.8.0".dev or false) ||
        (digest."0.8.0"."dev" or false); }
      { "0.8.0".default = (f.digest."0.8.0".default or true); }
    ];
    generic_array."${deps.digest."0.8.0".generic_array}".default = true;
  }) [
    (features_.generic_array."${deps."digest"."0.8.0"."generic_array"}" deps)
  ];


# end
# either-1.5.1

  crates.either."1.5.1" = deps: { features?(features_.either."1.5.1" deps {}) }: buildRustCrate {
    crateName = "either";
    version = "1.5.1";
    description = "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.\n";
    authors = [ "bluss" ];
    sha256 = "049dmvnyrrhf0fw955jrfazdapdl84x32grwwxllh8in39yv3783";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."either"."1.5.1" or {});
  };
  features_.either."1.5.1" = deps: f: updateFeatures f (rec {
    either = fold recursiveUpdate {} [
      { "1.5.1"."use_std" =
        (f.either."1.5.1"."use_std" or false) ||
        (f.either."1.5.1".default or false) ||
        (either."1.5.1"."default" or false); }
      { "1.5.1".default = (f.either."1.5.1".default or true); }
    ];
  }) [];


# end
# errno-0.2.4

  crates.errno."0.2.4" = deps: { features?(features_.errno."0.2.4" deps {}) }: buildRustCrate {
    crateName = "errno";
    version = "0.2.4";
    description = "Cross-platform interface to the `errno` variable.";
    authors = [ "Chris Wong <lambda.fairy@gmail.com>" ];
    sha256 = "145rd8ccjsj99hxkw9g9gnak56qqxlq85hqyj35wba6j2ibxbwy2";
    dependencies = (if kernel == "dragonfly" then mapFeatures features ([
      (crates."errno_dragonfly"."${deps."errno"."0.2.4"."errno_dragonfly"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."errno"."0.2.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."errno"."0.2.4"."winapi"}" deps)
    ]) else []);
  };
  features_.errno."0.2.4" = deps: f: updateFeatures f (rec {
    errno."0.2.4".default = (f.errno."0.2.4".default or true);
    errno_dragonfly."${deps.errno."0.2.4".errno_dragonfly}".default = true;
    libc."${deps.errno."0.2.4".libc}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.errno."0.2.4".winapi}"."errhandlingapi" = true; }
      { "${deps.errno."0.2.4".winapi}"."minwindef" = true; }
      { "${deps.errno."0.2.4".winapi}"."ntdef" = true; }
      { "${deps.errno."0.2.4".winapi}"."winbase" = true; }
      { "${deps.errno."0.2.4".winapi}".default = true; }
    ];
  }) [
    (features_.errno_dragonfly."${deps."errno"."0.2.4"."errno_dragonfly"}" deps)
    (features_.libc."${deps."errno"."0.2.4"."libc"}" deps)
    (features_.winapi."${deps."errno"."0.2.4"."winapi"}" deps)
  ];


# end
# errno-dragonfly-0.1.1

  crates.errno_dragonfly."0.1.1" = deps: { features?(features_.errno_dragonfly."0.1.1" deps {}) }: buildRustCrate {
    crateName = "errno-dragonfly";
    version = "0.1.1";
    description = "Exposes errno functionality to stable Rust on DragonFlyBSD";
    authors = [ "Michael Neumann <mneumann@ntecs.de>" ];
    sha256 = "1bpnr0z3bl2zxnm7syqbgmxsj18qm8l4s1jxr7czpbhdqhgfgvcf";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."errno_dragonfly"."0.1.1"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."gcc"."${deps."errno_dragonfly"."0.1.1"."gcc"}" deps)
    ]);
  };
  features_.errno_dragonfly."0.1.1" = deps: f: updateFeatures f (rec {
    errno_dragonfly."0.1.1".default = (f.errno_dragonfly."0.1.1".default or true);
    gcc."${deps.errno_dragonfly."0.1.1".gcc}".default = true;
    libc."${deps.errno_dragonfly."0.1.1".libc}".default = true;
  }) [
    (features_.libc."${deps."errno_dragonfly"."0.1.1"."libc"}" deps)
    (features_.gcc."${deps."errno_dragonfly"."0.1.1"."gcc"}" deps)
  ];


# end
# fake-simd-0.1.2

  crates.fake_simd."0.1.2" = deps: { features?(features_.fake_simd."0.1.2" deps {}) }: buildRustCrate {
    crateName = "fake-simd";
    version = "0.1.2";
    description = "Crate for mimicking simd crate on stable Rust";
    authors = [ "The Rust-Crypto Project Developers" ];
    sha256 = "1a0f1j66nkwfy17s06vm2bn9vh8vy8llcijfhh9m10p58v08661a";
  };
  features_.fake_simd."0.1.2" = deps: f: updateFeatures f (rec {
    fake_simd."0.1.2".default = (f.fake_simd."0.1.2".default or true);
  }) [];


# end
# field-offset-0.1.1

  crates.field_offset."0.1.1" = deps: { features?(features_.field_offset."0.1.1" deps {}) }: buildRustCrate {
    crateName = "field-offset";
    version = "0.1.1";
    description = "Safe pointer-to-member implementation";
    authors = [ "Diggory Blake <diggsey@googlemail.com>" ];
    sha256 = "08569dimpx3w2xmds5q7hxws50fyjvl2335dhkw3avy97dl5xg22";
  };
  features_.field_offset."0.1.1" = deps: f: updateFeatures f (rec {
    field_offset."0.1.1".default = (f.field_offset."0.1.1".default or true);
  }) [];


# end
# flate2-1.0.6

  crates.flate2."1.0.6" = deps: { features?(features_.flate2."1.0.6" deps {}) }: buildRustCrate {
    crateName = "flate2";
    version = "1.0.6";
    description = "Bindings to miniz.c for DEFLATE compression and decompression exposed as\nReader/Writer streams. Contains bindings for zlib, deflate, and gzip-based\nstreams.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0l2rkb5labwhacv9jdjw7fwd7r54a6jw976q89kiwa9xhn1yxkld";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."flate2"."1.0.6"."crc32fast"}" deps)
      (crates."libc"."${deps."flate2"."1.0.6"."libc"}" deps)
    ]
      ++ (if features.flate2."1.0.6".miniz_oxide_c_api or false then [ (crates.miniz_oxide_c_api."${deps."flate2"."1.0.6".miniz_oxide_c_api}" deps) ] else []))
      ++ (if cpu == "wasm32" && !(kernel == "emscripten") then mapFeatures features ([
      (crates."miniz_oxide_c_api"."${deps."flate2"."1.0.6"."miniz_oxide_c_api"}" deps)
    ]) else []);
    features = mkFeatures (features."flate2"."1.0.6" or {});
  };
  features_.flate2."1.0.6" = deps: f: updateFeatures f (rec {
    crc32fast."${deps.flate2."1.0.6".crc32fast}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "1.0.6"."futures" =
        (f.flate2."1.0.6"."futures" or false) ||
        (f.flate2."1.0.6".tokio or false) ||
        (flate2."1.0.6"."tokio" or false); }
      { "1.0.6"."libz-sys" =
        (f.flate2."1.0.6"."libz-sys" or false) ||
        (f.flate2."1.0.6".zlib or false) ||
        (flate2."1.0.6"."zlib" or false); }
      { "1.0.6"."miniz-sys" =
        (f.flate2."1.0.6"."miniz-sys" or false) ||
        (f.flate2."1.0.6".default or false) ||
        (flate2."1.0.6"."default" or false); }
      { "1.0.6"."miniz_oxide_c_api" =
        (f.flate2."1.0.6"."miniz_oxide_c_api" or false) ||
        (f.flate2."1.0.6".rust_backend or false) ||
        (flate2."1.0.6"."rust_backend" or false); }
      { "1.0.6"."tokio-io" =
        (f.flate2."1.0.6"."tokio-io" or false) ||
        (f.flate2."1.0.6".tokio or false) ||
        (flate2."1.0.6"."tokio" or false); }
      { "1.0.6".default = (f.flate2."1.0.6".default or true); }
    ];
    libc."${deps.flate2."1.0.6".libc}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "${deps.flate2."1.0.6".miniz_oxide_c_api}"."no_c_export" =
        (f.miniz_oxide_c_api."${deps.flate2."1.0.6".miniz_oxide_c_api}"."no_c_export" or false) ||
        true ||
        true; }
      { "${deps.flate2."1.0.6".miniz_oxide_c_api}".default = true; }
    ];
  }) [
    (features_.crc32fast."${deps."flate2"."1.0.6"."crc32fast"}" deps)
    (features_.libc."${deps."flate2"."1.0.6"."libc"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.6"."miniz_oxide_c_api"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.6"."miniz_oxide_c_api"}" deps)
  ];


# end
# fuchsia-cprng-0.1.0

  crates.fuchsia_cprng."0.1.0" = deps: { features?(features_.fuchsia_cprng."0.1.0" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.0";
    description = "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "0q7cllm3giiccvymdiizsqxiz21ja7wgmccz3my3bqwsl7mci5l7";
  };
  features_.fuchsia_cprng."0.1.0" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.0".default = (f.fuchsia_cprng."0.1.0".default or true);
  }) [];


# end
# gcc-0.3.55

  crates.gcc."0.3.55" = deps: { features?(features_.gcc."0.3.55" deps {}) }: buildRustCrate {
    crateName = "gcc";
    version = "0.3.55";
    description = "**Deprecated** crate, renamed to `cc`\n\nA build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "18qxv3hjdhp7pfcvbm2hvyicpgmk7xw8aii1l7fla8cxxbcrg2nz";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."gcc"."0.3.55" or {});
  };
  features_.gcc."0.3.55" = deps: f: updateFeatures f (rec {
    gcc = fold recursiveUpdate {} [
      { "0.3.55"."rayon" =
        (f.gcc."0.3.55"."rayon" or false) ||
        (f.gcc."0.3.55".parallel or false) ||
        (gcc."0.3.55"."parallel" or false); }
      { "0.3.55".default = (f.gcc."0.3.55".default or true); }
    ];
  }) [];


# end
# generic-array-0.12.0

  crates.generic_array."0.12.0" = deps: { features?(features_.generic_array."0.12.0" deps {}) }: buildRustCrate {
    crateName = "generic-array";
    version = "0.12.0";
    description = "Generic types implementing functionality of arrays";
    authors = [ "Bartłomiej Kamiński <fizyk20@gmail.com>" "Aaron Trent <novacrazy@gmail.com>" ];
    sha256 = "12fjpkx1ilqlmynis45g0gh69zkad6jnsc589j64z3idk18lvv91";
    libName = "generic_array";
    dependencies = mapFeatures features ([
      (crates."typenum"."${deps."generic_array"."0.12.0"."typenum"}" deps)
    ]);
  };
  features_.generic_array."0.12.0" = deps: f: updateFeatures f (rec {
    generic_array."0.12.0".default = (f.generic_array."0.12.0".default or true);
    typenum."${deps.generic_array."0.12.0".typenum}".default = true;
  }) [
    (features_.typenum."${deps."generic_array"."0.12.0"."typenum"}" deps)
  ];


# end
# ident_case-1.0.0

  crates.ident_case."1.0.0" = deps: { features?(features_.ident_case."1.0.0" deps {}) }: buildRustCrate {
    crateName = "ident_case";
    version = "1.0.0";
    description = "Utility for applying case rules to Rust identifiers.";
    authors = [ "Ted Driggs <ted.driggs@outlook.com>" ];
    sha256 = "030qq2fqx2m49j4p816mkrji7ljwi551ff3i592wrwk134zwvcd2";
  };
  features_.ident_case."1.0.0" = deps: f: updateFeatures f (rec {
    ident_case."1.0.0".default = (f.ident_case."1.0.0".default or true);
  }) [];


# end
# itertools-0.8.0

  crates.itertools."0.8.0" = deps: { features?(features_.itertools."0.8.0" deps {}) }: buildRustCrate {
    crateName = "itertools";
    version = "0.8.0";
    description = "Extra iterator adaptors, iterator methods, free functions, and macros.";
    authors = [ "bluss" ];
    sha256 = "0xpz59yf03vyj540i7sqypn2aqfid08c4vzyg0l6rqm08da77n7n";
    dependencies = mapFeatures features ([
      (crates."either"."${deps."itertools"."0.8.0"."either"}" deps)
    ]);
    features = mkFeatures (features."itertools"."0.8.0" or {});
  };
  features_.itertools."0.8.0" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.8.0".either}".default = (f.either."${deps.itertools."0.8.0".either}".default or false);
    itertools = fold recursiveUpdate {} [
      { "0.8.0"."use_std" =
        (f.itertools."0.8.0"."use_std" or false) ||
        (f.itertools."0.8.0".default or false) ||
        (itertools."0.8.0"."default" or false); }
      { "0.8.0".default = (f.itertools."0.8.0".default or true); }
    ];
  }) [
    (features_.either."${deps."itertools"."0.8.0"."either"}" deps)
  ];


# end
# lazy_static-1.2.0

  crates.lazy_static."1.2.0" = deps: { features?(features_.lazy_static."1.2.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.2.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "07p3b30k2akyr6xw08ggd5qiz5nw3vd3agggj360fcc1njz7d0ss";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.2.0" or {});
  };
  features_.lazy_static."1.2.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.2.0"."spin" =
        (f.lazy_static."1.2.0"."spin" or false) ||
        (f.lazy_static."1.2.0".spin_no_std or false) ||
        (lazy_static."1.2.0"."spin_no_std" or false); }
      { "1.2.0".default = (f.lazy_static."1.2.0".default or true); }
    ];
  }) [];


# end
# libc-0.2.48

  crates.libc."0.2.48" = deps: { features?(features_.libc."0.2.48" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.48";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1jnjd4g9ibs02gd7z81amj7p1xkari0ciwg9if285fxnml4lmwxs";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.48" or {});
  };
  features_.libc."0.2.48" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.48"."align" =
        (f.libc."0.2.48"."align" or false) ||
        (f.libc."0.2.48".rustc-dep-of-std or false) ||
        (libc."0.2.48"."rustc-dep-of-std" or false); }
      { "0.2.48"."rustc-std-workspace-core" =
        (f.libc."0.2.48"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.48".rustc-dep-of-std or false) ||
        (libc."0.2.48"."rustc-dep-of-std" or false); }
      { "0.2.48"."use_std" =
        (f.libc."0.2.48"."use_std" or false) ||
        (f.libc."0.2.48".default or false) ||
        (libc."0.2.48"."default" or false); }
      { "0.2.48".default = (f.libc."0.2.48".default or true); }
    ];
  }) [];


# end
# line-wrap-0.1.1

  crates.line_wrap."0.1.1" = deps: { features?(features_.line_wrap."0.1.1" deps {}) }: buildRustCrate {
    crateName = "line-wrap";
    version = "0.1.1";
    description = "Efficiently insert line separators";
    authors = [ "Marshall Pierce <marshall@mpierce.org>" ];
    sha256 = "1m2mpjnlvdxkbj8q98wdwad37wbcj3w6g436l0hg39ljknvl4sil";
    dependencies = mapFeatures features ([
      (crates."safemem"."${deps."line_wrap"."0.1.1"."safemem"}" deps)
    ]);
  };
  features_.line_wrap."0.1.1" = deps: f: updateFeatures f (rec {
    line_wrap."0.1.1".default = (f.line_wrap."0.1.1".default or true);
    safemem."${deps.line_wrap."0.1.1".safemem}".default = true;
  }) [
    (features_.safemem."${deps."line_wrap"."0.1.1"."safemem"}" deps)
  ];


# end
# md5-0.6.1

  crates.md5."0.6.1" = deps: { features?(features_.md5."0.6.1" deps {}) }: buildRustCrate {
    crateName = "md5";
    version = "0.6.1";
    description = "The package provides the MD5 hash function.";
    authors = [ "Ivan Ukhov <ivan.ukhov@gmail.com>" "Kamal Ahmad <shibe@openmailbox.org>" "Konstantin Stepanov <milezv@gmail.com>" "Lukas Kalbertodt <lukas.kalbertodt@gmail.com>" "Nathan Musoke <nathan.musoke@gmail.com>" "Tony Arcieri <bascule@gmail.com>" "Wim de With <register@dewith.io>" "Yosef Dinerstein <yosefdi@gmail.com>" ];
    sha256 = "0kkg05igb50l4v9c3dxd2mll548gkxqnj97sd2bnq3r433wa82d4";
  };
  features_.md5."0.6.1" = deps: f: updateFeatures f (rec {
    md5."0.6.1".default = (f.md5."0.6.1".default or true);
  }) [];


# end
# memchr-1.0.2

  crates.memchr."1.0.2" = deps: { features?(features_.memchr."1.0.2" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "1.0.2";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "0dfb8ifl9nrc9kzgd5z91q6qg87sh285q1ih7xgrsglmqfav9lg7";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.memchr."1.0.2".libc or false then [ (crates.libc."${deps."memchr"."1.0.2".libc}" deps) ] else []));
    features = mkFeatures (features."memchr"."1.0.2" or {});
  };
  features_.memchr."1.0.2" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "${deps.memchr."1.0.2".libc}"."use_std" =
        (f.libc."${deps.memchr."1.0.2".libc}"."use_std" or false) ||
        (memchr."1.0.2"."use_std" or false) ||
        (f."memchr"."1.0.2"."use_std" or false); }
      { "${deps.memchr."1.0.2".libc}".default = (f.libc."${deps.memchr."1.0.2".libc}".default or false); }
    ];
    memchr = fold recursiveUpdate {} [
      { "1.0.2"."libc" =
        (f.memchr."1.0.2"."libc" or false) ||
        (f.memchr."1.0.2".default or false) ||
        (memchr."1.0.2"."default" or false) ||
        (f.memchr."1.0.2".use_std or false) ||
        (memchr."1.0.2"."use_std" or false); }
      { "1.0.2"."use_std" =
        (f.memchr."1.0.2"."use_std" or false) ||
        (f.memchr."1.0.2".default or false) ||
        (memchr."1.0.2"."default" or false); }
      { "1.0.2".default = (f.memchr."1.0.2".default or true); }
    ];
  }) [
    (features_.libc."${deps."memchr"."1.0.2"."libc"}" deps)
  ];


# end
# memchr-2.1.3

  crates.memchr."2.1.3" = deps: { features?(features_.memchr."2.1.3" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.1.3";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "14nakv3gc8qvjdaal329nxp109zbmn710l2al7zjbcpij6i19nnk";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."memchr"."2.1.3"."cfg_if"}" deps)
    ]
      ++ (if features.memchr."2.1.3".libc or false then [ (crates.libc."${deps."memchr"."2.1.3".libc}" deps) ] else []));
    features = mkFeatures (features."memchr"."2.1.3" or {});
  };
  features_.memchr."2.1.3" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.memchr."2.1.3".cfg_if}".default = true;
    libc = fold recursiveUpdate {} [
      { "${deps.memchr."2.1.3".libc}"."use_std" =
        (f.libc."${deps.memchr."2.1.3".libc}"."use_std" or false) ||
        (memchr."2.1.3"."use_std" or false) ||
        (f."memchr"."2.1.3"."use_std" or false); }
      { "${deps.memchr."2.1.3".libc}".default = (f.libc."${deps.memchr."2.1.3".libc}".default or false); }
    ];
    memchr = fold recursiveUpdate {} [
      { "2.1.3"."libc" =
        (f.memchr."2.1.3"."libc" or false) ||
        (f.memchr."2.1.3".default or false) ||
        (memchr."2.1.3"."default" or false) ||
        (f.memchr."2.1.3".use_std or false) ||
        (memchr."2.1.3"."use_std" or false); }
      { "2.1.3"."use_std" =
        (f.memchr."2.1.3"."use_std" or false) ||
        (f.memchr."2.1.3".default or false) ||
        (memchr."2.1.3"."default" or false); }
      { "2.1.3".default = (f.memchr."2.1.3".default or true); }
    ];
  }) [
    (features_.cfg_if."${deps."memchr"."2.1.3"."cfg_if"}" deps)
    (features_.libc."${deps."memchr"."2.1.3"."libc"}" deps)
  ];


# end
# miniz_oxide-0.2.1

  crates.miniz_oxide."0.2.1" = deps: { features?(features_.miniz_oxide."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide";
    version = "0.2.1";
    description = "DEFLATE compression and decompression library rewritten in Rust based on miniz";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1ly14vlk0gq7czi1323l2dsy5y8dpvdwld4h9083i0y3hx9iyfdz";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
    ]);
  };
  features_.miniz_oxide."0.2.1" = deps: f: updateFeatures f (rec {
    adler32."${deps.miniz_oxide."0.2.1".adler32}".default = true;
    miniz_oxide."0.2.1".default = (f.miniz_oxide."0.2.1".default or true);
  }) [
    (features_.adler32."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
  ];


# end
# miniz_oxide_c_api-0.2.1

  crates.miniz_oxide_c_api."0.2.1" = deps: { features?(features_.miniz_oxide_c_api."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide_c_api";
    version = "0.2.1";
    description = "DEFLATE compression and decompression API designed to be Rust drop-in replacement for miniz";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1zsk334nhy2rvyhbr0815l0gp6w40al6rxxafkycaafx3m9j8cj2";
    build = "src/build.rs";
    dependencies = mapFeatures features ([
      (crates."crc"."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
      (crates."libc"."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
      (crates."miniz_oxide"."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
    ]);
    features = mkFeatures (features."miniz_oxide_c_api"."0.2.1" or {});
  };
  features_.miniz_oxide_c_api."0.2.1" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_oxide_c_api."0.2.1".cc}".default = true;
    crc."${deps.miniz_oxide_c_api."0.2.1".crc}".default = true;
    libc."${deps.miniz_oxide_c_api."0.2.1".libc}".default = true;
    miniz_oxide."${deps.miniz_oxide_c_api."0.2.1".miniz_oxide}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "0.2.1"."build_orig_miniz" =
        (f.miniz_oxide_c_api."0.2.1"."build_orig_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
      { "0.2.1"."build_stub_miniz" =
        (f.miniz_oxide_c_api."0.2.1"."build_stub_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.1".miniz_zip or false) ||
        (miniz_oxide_c_api."0.2.1"."miniz_zip" or false); }
      { "0.2.1"."no_c_export" =
        (f.miniz_oxide_c_api."0.2.1"."no_c_export" or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
      { "0.2.1".default = (f.miniz_oxide_c_api."0.2.1".default or true); }
    ];
  }) [
    (features_.crc."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
    (features_.libc."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
    (features_.miniz_oxide."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    (features_.cc."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
  ];


# end
# nom-3.2.1

  crates.nom."3.2.1" = deps: { features?(features_.nom."3.2.1" deps {}) }: buildRustCrate {
    crateName = "nom";
    version = "3.2.1";
    description = "A byte-oriented, zero-copy, parser combinators library";
    authors = [ "contact@geoffroycouprie.com" ];
    sha256 = "1vcllxrz9hdw6j25kn020ka3psz1vkaqh1hm3yfak2240zrxgi07";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."nom"."3.2.1"."memchr"}" deps)
    ]);
    features = mkFeatures (features."nom"."3.2.1" or {});
  };
  features_.nom."3.2.1" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "${deps.nom."3.2.1".memchr}"."use_std" =
        (f.memchr."${deps.nom."3.2.1".memchr}"."use_std" or false) ||
        (nom."3.2.1"."std" or false) ||
        (f."nom"."3.2.1"."std" or false); }
      { "${deps.nom."3.2.1".memchr}".default = (f.memchr."${deps.nom."3.2.1".memchr}".default or false); }
    ];
    nom = fold recursiveUpdate {} [
      { "3.2.1"."compiler_error" =
        (f.nom."3.2.1"."compiler_error" or false) ||
        (f.nom."3.2.1".nightly or false) ||
        (nom."3.2.1"."nightly" or false); }
      { "3.2.1"."lazy_static" =
        (f.nom."3.2.1"."lazy_static" or false) ||
        (f.nom."3.2.1".regexp_macros or false) ||
        (nom."3.2.1"."regexp_macros" or false); }
      { "3.2.1"."regex" =
        (f.nom."3.2.1"."regex" or false) ||
        (f.nom."3.2.1".regexp or false) ||
        (nom."3.2.1"."regexp" or false); }
      { "3.2.1"."regexp" =
        (f.nom."3.2.1"."regexp" or false) ||
        (f.nom."3.2.1".regexp_macros or false) ||
        (nom."3.2.1"."regexp_macros" or false); }
      { "3.2.1"."std" =
        (f.nom."3.2.1"."std" or false) ||
        (f.nom."3.2.1".default or false) ||
        (nom."3.2.1"."default" or false); }
      { "3.2.1"."stream" =
        (f.nom."3.2.1"."stream" or false) ||
        (f.nom."3.2.1".default or false) ||
        (nom."3.2.1"."default" or false); }
      { "3.2.1".default = (f.nom."3.2.1".default or true); }
    ];
  }) [
    (features_.memchr."${deps."nom"."3.2.1"."memchr"}" deps)
  ];


# end
# num-integer-0.1.39

  crates.num_integer."0.1.39" = deps: { features?(features_.num_integer."0.1.39" deps {}) }: buildRustCrate {
    crateName = "num-integer";
    version = "0.1.39";
    description = "Integer traits and functions";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1f42ls46cghs13qfzgbd7syib2zc6m7hlmv1qlar6c9mdxapvvbg";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_integer"."0.1.39"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."num_integer"."0.1.39" or {});
  };
  features_.num_integer."0.1.39" = deps: f: updateFeatures f (rec {
    num_integer = fold recursiveUpdate {} [
      { "0.1.39"."std" =
        (f.num_integer."0.1.39"."std" or false) ||
        (f.num_integer."0.1.39".default or false) ||
        (num_integer."0.1.39"."default" or false); }
      { "0.1.39".default = (f.num_integer."0.1.39".default or true); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_integer."0.1.39".num_traits}"."i128" =
        (f.num_traits."${deps.num_integer."0.1.39".num_traits}"."i128" or false) ||
        (num_integer."0.1.39"."i128" or false) ||
        (f."num_integer"."0.1.39"."i128" or false); }
      { "${deps.num_integer."0.1.39".num_traits}"."std" =
        (f.num_traits."${deps.num_integer."0.1.39".num_traits}"."std" or false) ||
        (num_integer."0.1.39"."std" or false) ||
        (f."num_integer"."0.1.39"."std" or false); }
      { "${deps.num_integer."0.1.39".num_traits}".default = (f.num_traits."${deps.num_integer."0.1.39".num_traits}".default or false); }
    ];
  }) [
    (features_.num_traits."${deps."num_integer"."0.1.39"."num_traits"}" deps)
  ];


# end
# num-traits-0.2.6

  crates.num_traits."0.2.6" = deps: { features?(features_.num_traits."0.2.6" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.6";
    description = "Numeric traits for generic mathematics";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1d20sil9n0wgznd1nycm3yjfj1mzyl41ambb7by1apxlyiil1azk";
    build = "build.rs";
    features = mkFeatures (features."num_traits"."0.2.6" or {});
  };
  features_.num_traits."0.2.6" = deps: f: updateFeatures f (rec {
    num_traits = fold recursiveUpdate {} [
      { "0.2.6"."std" =
        (f.num_traits."0.2.6"."std" or false) ||
        (f.num_traits."0.2.6".default or false) ||
        (num_traits."0.2.6"."default" or false); }
      { "0.2.6".default = (f.num_traits."0.2.6".default or true); }
    ];
  }) [];


# end
# opaque-debug-0.2.2

  crates.opaque_debug."0.2.2" = deps: { features?(features_.opaque_debug."0.2.2" deps {}) }: buildRustCrate {
    crateName = "opaque-debug";
    version = "0.2.2";
    description = "Macro for opaque Debug trait implementation";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0dkzsnxpg50gz3gjcdzc4j6g4s0jphllg6q7jqmsy9nd9glidy74";
  };
  features_.opaque_debug."0.2.2" = deps: f: updateFeatures f (rec {
    opaque_debug."0.2.2".default = (f.opaque_debug."0.2.2".default or true);
  }) [];


# end
# proc-macro2-0.4.29

  crates.proc_macro2."0.4.29" = deps: { features?(features_.proc_macro2."0.4.29" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.29";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "08jfiqzh7drl67061aiwv9g93rpzydg39wvsyw4jn2h3n6chw1x3";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.29"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.29" or {});
  };
  features_.proc_macro2."0.4.29" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.29"."proc-macro" =
        (f.proc_macro2."0.4.29"."proc-macro" or false) ||
        (f.proc_macro2."0.4.29".default or false) ||
        (proc_macro2."0.4.29"."default" or false); }
      { "0.4.29".default = (f.proc_macro2."0.4.29".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.29".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.29"."unicode_xid"}" deps)
  ];


# end
# quote-0.3.15

  crates.quote."0.3.15" = deps: { features?(features_.quote."0.3.15" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.3.15";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "09il61jv4kd1360spaj46qwyl21fv1qz18fsv2jra8wdnlgl5jsg";
  };
  features_.quote."0.3.15" = deps: f: updateFeatures f (rec {
    quote."0.3.15".default = (f.quote."0.3.15".default or true);
  }) [];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12"."proc-macro" =
        (f.quote."0.6.12"."proc-macro" or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5"."alloc" =
        (f.rand."0.6.5"."alloc" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."packed_simd" =
        (f.rand."0.6.5"."packed_simd" or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5"."rand_os" =
        (f.rand."0.6.5"."rand_os" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."simd_support" =
        (f.rand."0.6.5"."simd_support" or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5"."std" =
        (f.rand."0.6.5"."std" or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    description = "ChaCha random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1"."std" =
        (f.rand_core."0.3.1"."std" or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0"."alloc" =
        (f.rand_core."0.4.0"."alloc" or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0"."serde" =
        (f.rand_core."0.4.0"."serde" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0"."serde_derive" =
        (f.rand_core."0.4.0"."serde_derive" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    description = "HC128 random number generator\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    description = "ISAAC random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_isaac."0.1.1"."serde" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_isaac."0.1.1"."serde_derive" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.2

  crates.rand_jitter."0.1.2" = deps: { features?(features_.rand_jitter."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.2";
    description = "Random number generator based on timing jitter";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0jrjl1fjag8d27lg8r9nrzkhzqji2idzn6901a0wb70ghc48w1d8";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.2"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.2"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.2" or {});
  };
  features_.rand_jitter."0.1.2" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.2".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.2".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.2".rand_core}"."std" or false) ||
        (rand_jitter."0.1.2"."std" or false) ||
        (f."rand_jitter"."0.1.2"."std" or false); }
      { "${deps.rand_jitter."0.1.2".rand_core}".default = true; }
    ];
    rand_jitter."0.1.2".default = (f.rand_jitter."0.1.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.2".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.2".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.2"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.2"."winapi"}" deps)
  ];


# end
# rand_os-0.1.2

  crates.rand_os."0.1.2" = deps: { features?(features_.rand_os."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.2";
    description = "OS backed Random Number Generator";
    authors = [ "The Rand Project Developers" ];
    sha256 = "07wzs8zn24gc6kg7sv75dszxswm6kd47zd4c1fg9h1d7bkwd4337";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.2"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.2"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.2"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.2"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.2"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.2" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.2".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.2".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.2".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.2".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.2".rand_core}".default = true; }
    ];
    rand_os."0.1.2".default = (f.rand_os."0.1.2".default or true);
    rdrand."${deps.rand_os."0.1.2".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.2".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.2".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.2".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.2"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.2"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.2"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.2"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.2"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.2"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.1

  crates.rand_pcg."0.1.1" = deps: { features?(features_.rand_pcg."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.1";
    description = "Selected PCG random number generators\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0x6pzldj0c8c7gmr67ni5i7w2f7n7idvs3ckx0fc3wkhwl7wrbza";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."rand_pcg"."0.1.1"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.1" or {});
  };
  features_.rand_pcg."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_pcg."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_pcg."0.1.1".rand_core}".default or false);
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_pcg."0.1.1"."serde" or false) ||
        (f.rand_pcg."0.1.1".serde1 or false) ||
        (rand_pcg."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_pcg."0.1.1"."serde_derive" or false) ||
        (f.rand_pcg."0.1.1".serde1 or false) ||
        (rand_pcg."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_pcg."0.1.1".default or true); }
    ];
    rustc_version."${deps.rand_pcg."0.1.1".rustc_version}".default = true;
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.1"."rand_core"}" deps)
    (features_.rustc_version."${deps."rand_pcg"."0.1.1"."rustc_version"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    description = "Xorshift random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_xorshift."0.1.1"."serde" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_xorshift."0.1.1"."serde_derive" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    description = "An implementation of random number generator based on rdrand and rdseed instructions";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0"."std" =
        (f.rdrand."0.4.0"."std" or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.51

  crates.redox_syscall."0.1.51" = deps: { features?(features_.redox_syscall."0.1.51" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.51";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1a61cv7yydx64vpyvzr0z0hwzdvy4gcvcnfc6k70zpkngj5sz3ip";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.51" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.51".default = (f.redox_syscall."0.1.51".default or true);
  }) [];


# end
# regex-0.2.11

  crates.regex."0.2.11" = deps: { features?(features_.regex."0.2.11" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "0.2.11";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0r50cymxdqp0fv1dxd22mjr6y32q450nwacd279p9s7lh0cafijj";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."0.2.11"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."0.2.11"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."0.2.11"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."0.2.11"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."0.2.11"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."0.2.11" or {});
  };
  features_.regex."0.2.11" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."0.2.11".aho_corasick}".default = true;
    memchr."${deps.regex."0.2.11".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "0.2.11"."pattern" =
        (f.regex."0.2.11"."pattern" or false) ||
        (f.regex."0.2.11".unstable or false) ||
        (regex."0.2.11"."unstable" or false); }
      { "0.2.11".default = (f.regex."0.2.11".default or true); }
    ];
    regex_syntax."${deps.regex."0.2.11".regex_syntax}".default = true;
    thread_local."${deps.regex."0.2.11".thread_local}".default = true;
    utf8_ranges."${deps.regex."0.2.11".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."0.2.11"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."0.2.11"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."0.2.11"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."0.2.11"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."0.2.11"."utf8_ranges"}" deps)
  ];


# end
# regex-1.1.0

  crates.regex."1.1.0" = deps: { features?(features_.regex."1.1.0" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.0";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1myzfgs1yp6vs2rxyg6arn6ab05j6c2m922w3b4iv6zix1rl7z0n";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.0"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.0"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.0"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.0"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.0"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.0" or {});
  };
  features_.regex."1.1.0" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.0".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.0".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.0"."pattern" =
        (f.regex."1.1.0"."pattern" or false) ||
        (f.regex."1.1.0".unstable or false) ||
        (regex."1.1.0"."unstable" or false); }
      { "1.1.0"."use_std" =
        (f.regex."1.1.0"."use_std" or false) ||
        (f.regex."1.1.0".default or false) ||
        (regex."1.1.0"."default" or false); }
      { "1.1.0".default = (f.regex."1.1.0".default or true); }
    ];
    regex_syntax."${deps.regex."1.1.0".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.0".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.0".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.0"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.0"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.0"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.0"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.0"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.5.6

  crates.regex_syntax."0.5.6" = deps: { features?(features_.regex_syntax."0.5.6" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.5.6";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "10vf3r34bgjnbrnqd5aszn35bjvm8insw498l1vjy8zx5yms3427";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.5.6"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.5.6" = deps: f: updateFeatures f (rec {
    regex_syntax."0.5.6".default = (f.regex_syntax."0.5.6".default or true);
    ucd_util."${deps.regex_syntax."0.5.6".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.5.6"."ucd_util"}" deps)
  ];


# end
# regex-syntax-0.6.5

  crates.regex_syntax."0.6.5" = deps: { features?(features_.regex_syntax."0.6.5" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.5";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0aaaba1fan2qfyc31wzdmgmbmyirc27zgcbz41ba5wm1lb2d8kli";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.5" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.5".default = (f.regex_syntax."0.6.5".default or true);
    ucd_util."${deps.regex_syntax."0.6.5".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
  ];


# end
# remove_dir_all-0.5.1

  crates.remove_dir_all."0.5.1" = deps: { features?(features_.remove_dir_all."0.5.1" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.1";
    description = "A safe, reliable implementation of remove_dir_all for Windows";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "1chx3yvfbj46xjz4bzsvps208l46hfbcy0sm98gpiya454n4rrl7";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.1" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.1".default = (f.remove_dir_all."0.5.1".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.1".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
  ];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    description = "A library for querying the version of a installed rustc compiler";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# safemem-0.3.0

  crates.safemem."0.3.0" = deps: { features?(features_.safemem."0.3.0" deps {}) }: buildRustCrate {
    crateName = "safemem";
    version = "0.3.0";
    description = "Safe wrappers for memory-accessing functions, like `std::ptr::copy()`.";
    authors = [ "Austin Bonander <austin.bonander@gmail.com>" ];
    sha256 = "0pr39b468d05f6m7m4alsngmj5p7an8df21apsxbi57k0lmwrr18";
    features = mkFeatures (features."safemem"."0.3.0" or {});
  };
  features_.safemem."0.3.0" = deps: f: updateFeatures f (rec {
    safemem = fold recursiveUpdate {} [
      { "0.3.0"."std" =
        (f.safemem."0.3.0"."std" or false) ||
        (f.safemem."0.3.0".default or false) ||
        (safemem."0.3.0"."default" or false); }
      { "0.3.0".default = (f.safemem."0.3.0".default or true); }
    ];
  }) [];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    description = "Semantic version parsing and comparison.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0"."serde" =
        (f.semver."0.9.0"."serde" or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    description = "Parsing of the semver spec.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# sha1-0.6.0

  crates.sha1."0.6.0" = deps: { features?(features_.sha1."0.6.0" deps {}) }: buildRustCrate {
    crateName = "sha1";
    version = "0.6.0";
    description = "Minimal implementation of SHA1 for Rust.";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "12cp2b8f3hbwhfpnv1j1afl285xxmmbxh9w4npzvwbdh7xfyww8v";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."sha1"."0.6.0" or {});
  };
  features_.sha1."0.6.0" = deps: f: updateFeatures f (rec {
    sha1."0.6.0".default = (f.sha1."0.6.0".default or true);
  }) [];


# end
# sha2-0.8.0

  crates.sha2."0.8.0" = deps: { features?(features_.sha2."0.8.0" deps {}) }: buildRustCrate {
    crateName = "sha2";
    version = "0.8.0";
    description = "SHA-2 hash functions";
    authors = [ "RustCrypto Developers" ];
    sha256 = "0jhg56v7m6mj3jb857np4qvr72146garnabcgdk368fm0csfs1sq";
    dependencies = mapFeatures features ([
      (crates."block_buffer"."${deps."sha2"."0.8.0"."block_buffer"}" deps)
      (crates."digest"."${deps."sha2"."0.8.0"."digest"}" deps)
      (crates."fake_simd"."${deps."sha2"."0.8.0"."fake_simd"}" deps)
      (crates."opaque_debug"."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
    ]);
    features = mkFeatures (features."sha2"."0.8.0" or {});
  };
  features_.sha2."0.8.0" = deps: f: updateFeatures f (rec {
    block_buffer."${deps.sha2."0.8.0".block_buffer}".default = true;
    digest = fold recursiveUpdate {} [
      { "${deps.sha2."0.8.0".digest}"."std" =
        (f.digest."${deps.sha2."0.8.0".digest}"."std" or false) ||
        (sha2."0.8.0"."std" or false) ||
        (f."sha2"."0.8.0"."std" or false); }
      { "${deps.sha2."0.8.0".digest}".default = true; }
    ];
    fake_simd."${deps.sha2."0.8.0".fake_simd}".default = true;
    opaque_debug."${deps.sha2."0.8.0".opaque_debug}".default = true;
    sha2 = fold recursiveUpdate {} [
      { "0.8.0"."sha2-asm" =
        (f.sha2."0.8.0"."sha2-asm" or false) ||
        (f.sha2."0.8.0".asm or false) ||
        (sha2."0.8.0"."asm" or false); }
      { "0.8.0"."std" =
        (f.sha2."0.8.0"."std" or false) ||
        (f.sha2."0.8.0".default or false) ||
        (sha2."0.8.0"."default" or false); }
      { "0.8.0".default = (f.sha2."0.8.0".default or true); }
    ];
  }) [
    (features_.block_buffer."${deps."sha2"."0.8.0"."block_buffer"}" deps)
    (features_.digest."${deps."sha2"."0.8.0"."digest"}" deps)
    (features_.fake_simd."${deps."sha2"."0.8.0"."fake_simd"}" deps)
    (features_.opaque_debug."${deps."sha2"."0.8.0"."opaque_debug"}" deps)
  ];


# end
# syn-0.11.11

  crates.syn."0.11.11" = deps: { features?(features_.syn."0.11.11" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.11.11";
    description = "Nom parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0yw8ng7x1dn5a6ykg0ib49y7r9nhzgpiq2989rqdp7rdz3n85502";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.syn."0.11.11".quote or false then [ (crates.quote."${deps."syn"."0.11.11".quote}" deps) ] else [])
      ++ (if features.syn."0.11.11".synom or false then [ (crates.synom."${deps."syn"."0.11.11".synom}" deps) ] else [])
      ++ (if features.syn."0.11.11".unicode-xid or false then [ (crates.unicode_xid."${deps."syn"."0.11.11".unicode_xid}" deps) ] else []));
    features = mkFeatures (features."syn"."0.11.11" or {});
  };
  features_.syn."0.11.11" = deps: f: updateFeatures f (rec {
    quote."${deps.syn."0.11.11".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "0.11.11"."parsing" =
        (f.syn."0.11.11"."parsing" or false) ||
        (f.syn."0.11.11".default or false) ||
        (syn."0.11.11"."default" or false); }
      { "0.11.11"."printing" =
        (f.syn."0.11.11"."printing" or false) ||
        (f.syn."0.11.11".default or false) ||
        (syn."0.11.11"."default" or false); }
      { "0.11.11"."quote" =
        (f.syn."0.11.11"."quote" or false) ||
        (f.syn."0.11.11".printing or false) ||
        (syn."0.11.11"."printing" or false); }
      { "0.11.11"."synom" =
        (f.syn."0.11.11"."synom" or false) ||
        (f.syn."0.11.11".parsing or false) ||
        (syn."0.11.11"."parsing" or false); }
      { "0.11.11"."unicode-xid" =
        (f.syn."0.11.11"."unicode-xid" or false) ||
        (f.syn."0.11.11".parsing or false) ||
        (syn."0.11.11"."parsing" or false); }
      { "0.11.11".default = (f.syn."0.11.11".default or true); }
    ];
    synom."${deps.syn."0.11.11".synom}".default = true;
    unicode_xid."${deps.syn."0.11.11".unicode_xid}".default = true;
  }) [
    (features_.quote."${deps."syn"."0.11.11"."quote"}" deps)
    (features_.synom."${deps."syn"."0.11.11"."synom"}" deps)
    (features_.unicode_xid."${deps."syn"."0.11.11"."unicode_xid"}" deps)
  ];


# end
# syn-0.15.33

  crates.syn."0.15.33" = deps: { features?(features_.syn."0.15.33" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.33";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "19fv7nh1k3adh7dnbz45jg645v358n6kw8zf9xlhfcsc3532wy2j";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.33"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.33"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.33".quote or false then [ (crates.quote."${deps."syn"."0.15.33".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.33" or {});
  };
  features_.syn."0.15.33" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.33".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.33".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.33"."proc-macro" or false) ||
        (f."syn"."0.15.33"."proc-macro" or false); }
      { "${deps.syn."0.15.33".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.33".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.33".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.33".quote}"."proc-macro" or false) ||
        (syn."0.15.33"."proc-macro" or false) ||
        (f."syn"."0.15.33"."proc-macro" or false); }
      { "${deps.syn."0.15.33".quote}".default = (f.quote."${deps.syn."0.15.33".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.33"."clone-impls" =
        (f.syn."0.15.33"."clone-impls" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."derive" =
        (f.syn."0.15.33"."derive" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."parsing" =
        (f.syn."0.15.33"."parsing" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."printing" =
        (f.syn."0.15.33"."printing" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."proc-macro" =
        (f.syn."0.15.33"."proc-macro" or false) ||
        (f.syn."0.15.33".default or false) ||
        (syn."0.15.33"."default" or false); }
      { "0.15.33"."quote" =
        (f.syn."0.15.33"."quote" or false) ||
        (f.syn."0.15.33".printing or false) ||
        (syn."0.15.33"."printing" or false); }
      { "0.15.33".default = (f.syn."0.15.33".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.33".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.33"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.33"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.33"."unicode_xid"}" deps)
  ];


# end
# synom-0.11.3

  crates.synom."0.11.3" = deps: { features?(features_.synom."0.11.3" deps {}) }: buildRustCrate {
    crateName = "synom";
    version = "0.11.3";
    description = "Stripped-down Nom parser used by Syn";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1l6d1s9qjfp6ng2s2z8219igvlv7gyk8gby97sdykqc1r93d8rhc";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."synom"."0.11.3"."unicode_xid"}" deps)
    ]);
  };
  features_.synom."0.11.3" = deps: f: updateFeatures f (rec {
    synom."0.11.3".default = (f.synom."0.11.3".default or true);
    unicode_xid."${deps.synom."0.11.3".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."synom"."0.11.3"."unicode_xid"}" deps)
  ];


# end
# systemstat-0.1.4

  crates.systemstat."0.1.4" = deps: { features?(features_.systemstat."0.1.4" deps {}) }: buildRustCrate {
    crateName = "systemstat";
    version = "0.1.4";
    description = "systemstat";
    authors = [ "Greg V <greg@unrelenting.technology>" ];
    sha256 = "168jzq6v07zbms08xks8zxawkrxr7hrkr0jmnx7vfsr6ysap4d8f";
    dependencies = mapFeatures features ([
      (crates."bytesize"."${deps."systemstat"."0.1.4"."bytesize"}" deps)
      (crates."chrono"."${deps."systemstat"."0.1.4"."chrono"}" deps)
      (crates."lazy_static"."${deps."systemstat"."0.1.4"."lazy_static"}" deps)
      (crates."libc"."${deps."systemstat"."0.1.4"."libc"}" deps)
      (crates."time"."${deps."systemstat"."0.1.4"."time"}" deps)
    ])
      ++ (if kernel == "linux" || kernel == "android" then mapFeatures features ([
      (crates."nom"."${deps."systemstat"."0.1.4"."nom"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."systemstat"."0.1.4"."winapi"}" deps)
    ]) else []);
  };
  features_.systemstat."0.1.4" = deps: f: updateFeatures f (rec {
    bytesize."${deps.systemstat."0.1.4".bytesize}".default = true;
    chrono."${deps.systemstat."0.1.4".chrono}".default = true;
    lazy_static."${deps.systemstat."0.1.4".lazy_static}".default = true;
    libc."${deps.systemstat."0.1.4".libc}".default = true;
    nom."${deps.systemstat."0.1.4".nom}".default = true;
    systemstat."0.1.4".default = (f.systemstat."0.1.4".default or true);
    time."${deps.systemstat."0.1.4".time}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.systemstat."0.1.4".winapi}"."fileapi" = true; }
      { "${deps.systemstat."0.1.4".winapi}"."minwindef" = true; }
      { "${deps.systemstat."0.1.4".winapi}"."sysinfoapi" = true; }
      { "${deps.systemstat."0.1.4".winapi}"."winbase" = true; }
      { "${deps.systemstat."0.1.4".winapi}"."winerror" = true; }
      { "${deps.systemstat."0.1.4".winapi}"."ws2def" = true; }
      { "${deps.systemstat."0.1.4".winapi}"."ws2ipdef" = true; }
      { "${deps.systemstat."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.bytesize."${deps."systemstat"."0.1.4"."bytesize"}" deps)
    (features_.chrono."${deps."systemstat"."0.1.4"."chrono"}" deps)
    (features_.lazy_static."${deps."systemstat"."0.1.4"."lazy_static"}" deps)
    (features_.libc."${deps."systemstat"."0.1.4"."libc"}" deps)
    (features_.time."${deps."systemstat"."0.1.4"."time"}" deps)
    (features_.nom."${deps."systemstat"."0.1.4"."nom"}" deps)
    (features_.winapi."${deps."systemstat"."0.1.4"."winapi"}" deps)
  ];


# end
# tempfile-3.0.7

  crates.tempfile."3.0.7" = deps: { features?(features_.tempfile."3.0.7" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.0.7";
    description = "A library for managing temporary files and directories.\n";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    sha256 = "19h7ch8fvisxrrmabcnhlfj6b8vg34zaw8491x141p0n0727niaf";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.0.7"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.0.7"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.0.7"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.0.7" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.0.7".cfg_if}".default = true;
    libc."${deps.tempfile."3.0.7".libc}".default = true;
    rand."${deps.tempfile."3.0.7".rand}".default = true;
    redox_syscall."${deps.tempfile."3.0.7".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.0.7".remove_dir_all}".default = true;
    tempfile."3.0.7".default = (f.tempfile."3.0.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.0.7".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.0.7".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.0.7"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.0.7"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.0.7"."winapi"}" deps)
  ];


# end
# term-0.5.1

  crates.term."0.5.1" = deps: { features?(features_.term."0.5.1" deps {}) }: buildRustCrate {
    crateName = "term";
    version = "0.5.1";
    description = "A terminal formatting library\n";
    authors = [ "The Rust Project Developers" "Steven Allen" ];
    sha256 = "02i9n98vv5na4v663mi739d33yvhyzvhm2sk42fx42j3raadp991";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."term"."0.5.1"."byteorder"}" deps)
    ])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."term"."0.5.1"."winapi"}" deps)
    ]) else []);
  };
  features_.term."0.5.1" = deps: f: updateFeatures f (rec {
    byteorder."${deps.term."0.5.1".byteorder}".default = true;
    term."0.5.1".default = (f.term."0.5.1".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.term."0.5.1".winapi}"."fileapi" = true; }
      { "${deps.term."0.5.1".winapi}"."handleapi" = true; }
      { "${deps.term."0.5.1".winapi}"."wincon" = true; }
      { "${deps.term."0.5.1".winapi}".default = true; }
    ];
  }) [
    (features_.byteorder."${deps."term"."0.5.1"."byteorder"}" deps)
    (features_.winapi."${deps."term"."0.5.1"."winapi"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# time-0.1.42

  crates.time."0.1.42" = deps: { features?(features_.time."0.1.42" deps {}) }: buildRustCrate {
    crateName = "time";
    version = "0.1.42";
    description = "Utilities for working with time-related functions in Rust.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ny809kmdjwd4b478ipc33dz7q6nq7rxk766x8cnrg6zygcksmmx";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."time"."0.1.42"."libc"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."time"."0.1.42"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."time"."0.1.42"."winapi"}" deps)
    ]) else []);
  };
  features_.time."0.1.42" = deps: f: updateFeatures f (rec {
    libc."${deps.time."0.1.42".libc}".default = true;
    redox_syscall."${deps.time."0.1.42".redox_syscall}".default = true;
    time."0.1.42".default = (f.time."0.1.42".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.time."0.1.42".winapi}"."minwinbase" = true; }
      { "${deps.time."0.1.42".winapi}"."minwindef" = true; }
      { "${deps.time."0.1.42".winapi}"."ntdef" = true; }
      { "${deps.time."0.1.42".winapi}"."profileapi" = true; }
      { "${deps.time."0.1.42".winapi}"."std" = true; }
      { "${deps.time."0.1.42".winapi}"."sysinfoapi" = true; }
      { "${deps.time."0.1.42".winapi}"."timezoneapi" = true; }
      { "${deps.time."0.1.42".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."time"."0.1.42"."libc"}" deps)
    (features_.redox_syscall."${deps."time"."0.1.42"."redox_syscall"}" deps)
    (features_.winapi."${deps."time"."0.1.42"."winapi"}" deps)
  ];


# end
# typenum-1.10.0

  crates.typenum."1.10.0" = deps: { features?(features_.typenum."1.10.0" deps {}) }: buildRustCrate {
    crateName = "typenum";
    version = "1.10.0";
    description = "Typenum is a Rust library for type-level numbers evaluated at compile time. It currently supports bits, unsigned integers, and signed integers. It also provides a type-level array of type-level numbers, but its implementation is incomplete.";
    authors = [ "Paho Lurie-Gregg <paho@paholg.com>" "Andre Bogus <bogusandre@gmail.com>" ];
    sha256 = "1v2cgg0mlzkg5prs7swysckgk2ay6bpda8m83c2sn3z77dcsx3bc";
    build = "build/main.rs";
    features = mkFeatures (features."typenum"."1.10.0" or {});
  };
  features_.typenum."1.10.0" = deps: f: updateFeatures f (rec {
    typenum."1.10.0".default = (f.typenum."1.10.0".default or true);
  }) [];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    description = "A small utility library for working with the Unicode character database.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicode-xid-0.0.4

  crates.unicode_xid."0.0.4" = deps: { features?(features_.unicode_xid."0.0.4" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.0.4";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "1dc8wkkcd3s6534s5aw4lbjn8m67flkkbnajp5bl8408wdg8rh9v";
    features = mkFeatures (features."unicode_xid"."0.0.4" or {});
  };
  features_.unicode_xid."0.0.4" = deps: f: updateFeatures f (rec {
    unicode_xid."0.0.4".default = (f.unicode_xid."0.0.4".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    description = "Convert ranges of Unicode codepoints to UTF-8 byte ranges.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# winapi-0.3.6

  crates.winapi."0.3.6" = deps: { features?(features_.winapi."0.3.6" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.6";
    description = "Raw FFI bindings for all of Windows API.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1d9jfp4cjd82sr1q4dgdlrkvm33zhhav9d7ihr0nivqbncr059m4";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.6" or {});
  };
  features_.winapi."0.3.6" = deps: f: updateFeatures f (rec {
    winapi."0.3.6".default = (f.winapi."0.3.6".default or true);
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.6".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.6".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
}
