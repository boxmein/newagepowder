newagepowder
============

  Literally The Powder Toy only with a very old version. 


Building
--------

  Linux
  ~~~~~

    http://powdertoy.co.uk/Wiki/W/Compiling_for_Linux.html

    You'll need these packages:
    * libsdl1.2-dev (or 1.n, but not 2.n) 
    * libbz2-dev

    If you're on any system with the APT package manager you can get the 
    packages with this command: 
    % make deps
    ... which expands to 
    % sudo apt-get install libsdl1.2-dev libbz2-dev

    For other package managers, I'll leave finding out the package names 
    (which very often overlap but not always) as an exercise to the reader.

  Windows
  ~~~~~~~

    It's easier if you get MinGW (select the base, msys and C++ packages).


    (Note: chances are your %PATH% won't be updated after the install until
     the next restart so if you're impatient you can use the following: 
     `set PATH=%PATH%;C:\MinGW\bin` command in order to put the MinGW binary
     directory into the search path temporarily)

    You'll have to acquire the same packages: 
    You can get bzip2 within mingw-get
    > mingw-get install mingw32-libbz2 bzip2

    ...but SDL is a trickier business: you'll have to install it yourself.
    http://libsdl.org/release/SDL-devel-1.2.15-mingw32.tar.gz

    You will have to copy this into C:\MinGW\include\ so that it will all be 
    in its own separate SDL directory: C:\MinGW\include\SDL\SDL.h for example. 

    Also it'll include libSDL.a and libSDLmain.a which must be copied into
    C:\MinGW\lib. 

    After all those it should compile cleanly. Running however requires SDL.dll
    which can be acquired here:
    http://libsdl.org/release/SDL-1.2.15-win32.zip
    http://libsdl.org/release/SDL-1.2.15-win32-x64.zip (64-bit) 

    The two can either be placed to any directory on the PATH or into the repo's
    directory itself.

  OSX
  ~~~

    ....Well we don't really know.
    http://powdertoy.co.uk/Wiki/W/Compiling_for_Mac_OS_X.html
    This guide might help you. Note that you will NOT need Lua, FFTW et al
    to compile. All you'll need is SDL and libbz2.

Font editor???
--------------

  The font editor has been relocated to 
  https://github.com/boxmein/tpt-font-editor . 
  The font.h produced is compatible, yet the program itself is far more
  reasonable to use. Make sure to unpack the current font.h before editing.

Credits
-------

  Originally by Skylark
  This project started by Ristovski, Nibble and boxmein 
  from irc.freenode.net #newagepowder

  Still licensed under the GPL which can be found in ./LICENSE