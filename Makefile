vendor:
	cd remacs/rust_src && cargo vendor -x && cp -r vendor/ ../../vendor;
	cd remacs/rust_src/remacs-bindings && cargo vendor -x && cp -r vendor/* ../../../vendor;
	cd remacs/lib-src/hashdir && cargo vendor -x && cp -r vendor/* ../../../vendor;
