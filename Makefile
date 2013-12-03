SOURCES := powder.c http.c md5.c update.c
HEADERS := font.h http.h md5.h icon.h update.h fbi.h

CFLAGS := -Wall -std=c99 -D_POSIX_C_SOURCE=200112L -fgnu89-inline
OFLAGS := -O3 -ffast-math -ftree-vectorize -funsafe-math-optimizations
LFLAGS := -lSDL -lm -lbz2 
MFLAGS_SSE3 := -march=k8 -DX86 -DX86_SSE3 -msse3
MFLAGS_SSE2 := -march=k8 -DX86 -DX86_SSE2
MFLAGS_SSE := -march=pentium3 -DX86 -DX86_SSE
FLAGS_DBUG := -Wall -std=c99 -pg -O2 -DX86 -DX86_SSE3 -msse3 -lSDL -lm -lpthread -lbz2

LINUX_TARG := powder-64-sse2 powder-sse powder-sse2
WIN32_TARG := powder-sse.exe powder-sse2.exe

# Linux builds

all: powder
powder: powder-sse
powder-64: $(SOURCES) $(HEADERS)
	gcc -m64 -DINTERNAL -o $@ $(CFLAGS) $(OFLAGS) $(LFLAGS) $(MFLAGS_SSE3) $(SOURCES) -DLIN64

powder-debug: $(SOURCES) $(HEADERS)
	gcc -m64 -o $@ $(FLAGS_DBUG) -DLIN64 $(SOURCES)

powder-sse3: $(SOURCES) $(HEADERS)
	gcc -m32 -o $@ $(CFLAGS) $(OFLAGS) $(LFLAGS) $(MFLAGS_SSE3) $(SOURCES) -DLIN32
	strip $@
powder-sse2: $(SOURCES) $(HEADERS)
	gcc -m32 -o $@ $(CFLAGS) $(OFLAGS) $(LFLAGS) $(MFLAGS_SSE2) $(SOURCES) -DLIN32
	strip $@
powder-sse: $(SOURCES) $(HEADERS)
	gcc -m32 -o $@ $(CFLAGS) $(OFLAGS) $(LFLAGS) $(MFLAGS_SSE) $(SOURCES) -DLIN32
	strip $@

powder-64-sse3: $(SOURCES) $(HEADERS)
	gcc -m64 -o $@ $(CFLAGS) $(OFLAGS) $(LFLAGS) $(MFLAGS_SSE3) $(SOURCES) -DLIN64
	strip $@
powder-64-sse2: $(SOURCES) $(HEADERS)
	gcc -m64 -o $@ $(CFLAGS) $(OFLAGS) $(LFLAGS) $(MFLAGS_SSE2) $(SOURCES) -DLIN64
	strip $@


# Windows builds

powder-res.o: powder-res.rc powder.ico
	windres powder-res.rc powder-res.o

powder-sse3.exe: $(SOURCES) $(HEADERS) powder-res.o
	gcc -o $@ $(CFLAGS) $(OFLAGS) $(MFLAGS_SSE3) $(SOURCES) powder-res.o -lmingw32 -lws2_32 -lSDLmain $(LFLAGS) -mwindows -DWIN32

powder-sse2.exe: $(SOURCES) $(HEADERS) powder-res.o
	gcc -o $@ $(CFLAGS) $(OFLAGS) $(MFLAGS_SSE2) $(SOURCES) powder-res.o -lmingw32 -lws2_32 -lSDLmain $(LFLAGS) -mwindows -DWIN32

powder-sse.exe: $(SOURCES) $(HEADERS) powder-res.o
	gcc -o $@ $(CFLAGS) $(OFLAGS) $(MFLAGS_SSE) $(SOURCES) powder-res.o -lmingw32 -lws2_32 -lSDLmain $(LFLAGS) -mwindows -DWIN32

# Linux->Windows cross compiling
# I won't guarantee this works but it was in the original so it might

cross-powder-res.o: powder-res.rc powder.ico
        i586-mingw32msvc-windres powder-res.rc powder-res.o

cross-powder-sse3.exe: $(SOURCES) $(HEADERS) powder-res.o
        i586-mingw32msvc-gcc -o$@ $(CFLAGS) $(OFLAGS) $(MFLAGS_SSE3) $(SOURCES) powder-res.o -lmingw32 -lws2_32 -lSDLmain $(LFLAGS) -mwindows -DWIN32
        strip $@
        chmod 0644 $@
cross-powder-sse2.exe: $(SOURCES) $(HEADERS) powder-res.o
        i586-mingw32msvc-gcc -o$@ $(CFLAGS) $(OFLAGS) $(MFLAGS_SSE2) $(SOURCES) powder-res.o -lmingw32 -lws2_32 -lSDLmain $(LFLAGS) -mwindows -DWIN32
        strip $@
        chmod 0644 $@
cross-powder-sse.exe: $(SOURCES) $(HEADERS) powder-res.o
        i586-mingw32msvc-gcc -o$@ $(CFLAGS) $(OFLAGS) $(MFLAGS_SSE) $(SOURCES) powder-res.o -lmingw32 -lws2_32 -lSDLmain $(LFLAGS) -mwindows -DWIN32
        strip $@
        chmod 0644 $@


# Fetch all dependencies in one convenient command
deps: 
	sudo apt-get install libsdl1.2-dev libbz2-dev

# Windows: check out the readme
# OSX too
# non-Debian Linux too