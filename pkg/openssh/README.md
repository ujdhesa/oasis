# openssh

## config.h
Generated with

	./configure \
		--disable-wtmp \
		--without-pie \
		CPPFLAGS='-I/src/oasis/out/pkg/zlib/include' \
		LDFLAGS='-L/src/oasis/out/pkg/libressl -L/src/oasis/out/pkg/openbsd -L/src/oasis/out/pkg/zlib' \
		LIBS='-lcrypto -lbsd'

Several changes were made:
* `SECCOMP_AUDIT_ARCH` and `SANDBOX_SECCOMP_FILTER` were removed
  and instead defined in `gen.lua` dependent on the target toolchain
  architecture.
* `HAVE_STRNVIS` was undefined because although we do build it into
  `libbsd.a`, we don't include the whole openbsd header directory.
* `HAVE_PLEDGE` is defined because we have a stub definition in
  `pkg/openbsd/include/unistd.h`.
* `SIZEOF_*` are undefined because they are only used if C99 `int*_t` are not
  available.
* `_PATH_BTMP`, `_PATH_PASSWD_PROG`, `_PATH_SSH_PIDDIR` are moved to a top
  section along with a number of other paths which are normally defined
  with flags by the Makefile or automatically by `pathnames.h`.
