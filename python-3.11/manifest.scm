;; the versions in this manifest are defined by the accompanying channel
;; specification

;; zlib is a runtime dependency of the version of numpy on PyPI. To make sure
;; numpy finds libz.so, set LD_LIBRARY_PATH
;;
;;     export LD_LIBRARY_PATH=$GUIX_EXTRA_PROFILES/python-3.11/python-3.11/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

(specifications->manifest (list "python" "python:tk" "zlib"))
