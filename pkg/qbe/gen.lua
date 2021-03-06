cflags{
	'-Wall', '-Wextra', '-std=c99', '-pedantic',
	'-I $dir',
}

exe('qbe', [[
	main.c util.c parse.c cfg.c mem.c ssa.c alias.c load.c copy.c
	fold.c live.c spill.c rega.c gas.c
	amd64/(targ.c sysv.c isel.c emit.c)
	arm64/(targ.c abi.c isel.c emit.c)
]])
file('bin/qbe', '755', '$outdir/qbe')

fetch 'git'
