cflags{'-std=c99', '-Wall', '-pedantic'}

lib('libutf8proc.a', {'utf8proc.c'})

fetch 'git'
