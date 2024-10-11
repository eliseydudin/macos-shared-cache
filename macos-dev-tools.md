# macOS Developer Tools
Here's just a list of tools which can you help you with development (or in this case with decompilation and research).
To get them you need to do `xcode-select --install`.
I also suggest you get [homebrew](https://brew.sh), its very useful.

# Compilers
`cc`, `gcc` and `clang` are all shipped with XCode, however the first 2 are _basically_ aliases for `clang`. 
The clang compiler supports both C & ObjC. If you need to compile C++ you should use `g++` or `clang++`.

# Object manipulation
Binaries (executables, shared/static libraries) are what's known as object files. On macOS they can be inspected via several tools.

1. `otool` (object file display tool) lets you do several things, however there are 2 modes you'll be using the most: `-tv` - view the file's assembly (it writes the output into `stdout` so I suggest you do something like `otool -tv file | less`), and `-L` which shows libraries that are linked to this object.

2. `nm` shows all the symbols (functions or static variables) in a file. For example you can use it to find ObjC classes in framework binaries

# TODO
