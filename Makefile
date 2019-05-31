.PHONY: debug

vendor:
	cd remacs/rust_src && cargo vendor -x && cp -r vendor/ ../../vendor;
	cd remacs/rust_src/remacs-bindings && cargo vendor -x && cp -r vendor/* ../../../vendor;
	cd remacs/lib-src/hashdir && cargo vendor -x && cp -r vendor/* ../../../vendor;

debug:
	./result/bin/remacs -Q --eval '(progn (setq user-emacs-directory "$(dir ${INITFILE})" user-init-file "${INITFILE}") (load user-init-file))'
