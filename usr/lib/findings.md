# Findings /usr/lib/
Dynamic Libraries:
- `libcrypto.*.dylib` - the cryptography library used by OpenSSL.
- `libssl.*.dylib` - secure socket layer library.
- `libSystem.B.dylib` - the main library. It is automatically linked with every compiled executable, so it functions kinda like `libc` on Linux. It is also linked to many other libraries in `/usr/lib/system/`, which contain the function definitions for most of C's standard library.
- `libobjc.A.dylib` - ObjC runtime.
- `libstdc++.*.dylib` - GNU's implementation of C++'s STD.
- `libc++abi.dylib` - low level functions of C++'s standard library.
- `libc++.*.dylib` - abstraction over `libc++abi.dylib`.
- `libcurl.*.dylib` - cURL library.
- `libsqlite.*.dylib` - SQLite database library.
- `libz.*.dylib` - library for the Z compression algorithm.
...TODO

Directories:
- `i18n` - internationalization libraries.
- `log` - logger libraries used by Apple.
- `swift` - swift libraries.
- `system` - libraries which interact with the system + C's standard library.
- `updaters` - ??? (Probably some libraries to update system stuff hence the name)
- `usd` - ???

Other:
- `dyld` - The dynamic linker used by darwin.