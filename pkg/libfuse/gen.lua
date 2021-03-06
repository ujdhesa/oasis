cflags{
	'-D FUSE_USE_VERSION=33',
	'-I $dir',
	'-I $srcdir/include',
	'-I $srcdir/lib',
}

cc('lib/mount_util.c')

exe('fusermount3', {'util/fusermount.c', 'lib/mount_util.c.o'})
file('bin/fusermount3', '4755', '$outdir/fusermount3')
man{'doc/fusermount3.1'}

lib('libfuse.a', [[lib/(
	fuse.c fuse_loop.c fuse_loop_mt.c
	fuse_lowlevel.c fuse_opt.c
	fuse_signals.c buffer.c cuse_lowlevel.c
	helper.c modules/subdir.c
	mount.c mount_util.c.o
)]])

fetch 'git'
