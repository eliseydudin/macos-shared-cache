# macOS Shared Cache
Since MacOS Big Sur all system libraries are now stored as one large file over at `/System/Volumes/Preboot/Cryptexes/OS/System/Library/dyld/dyld_shared_cache_arm64e` so that reverse engineering them is harder.
This repository attempts to document the extracted binaries (via this [tool](https://github.com/keith/dyld-shared-cache-extractor)) and possibly decompile the libraries.

# File structure
The following tree is generated after using `dyld-shared-cache-extractor`:
```
.
├── System/
│   ├── iOSSupport/
│   │   ├── System/
│   │   │   └── Library/
│   │   │       ├── AccessibilityBundles/
│   │   │       │   ├── *.axbundle
│   │   │       │   └── *.dylib
│   │   │       ├── Extensions/
│   │   │       │   └── AppleMetalGLRenderer.bundle
│   │   │       ├── Frameworks/
│   │   │       │   └── *.framework
│   │   │       └── PrivateFrameworks/
│   │   │           └── *.framework
│   │   └── usr/
│   │       └── lib/
│   │           └── swift/
│   │               └── *.dylib
│   └── Library/
│       ├── Accounts/
│       │   ├── Authentication/
│       │   │   └── *.bundle
│       │   └── Notification/
│       │       └── *.bundle
│       ├── Assistant/
│       │   ├── Plugins/
│       │   │   └── *.assistantBundle
│       │   └── UIPlugins/
│       │       └── SiriFindMyUIPlugin.siriUIBundle
│       ├── CoreServices/
│       │   └── RawCamera.bundle
│       ├── Extensions/
│       │   ├── *.bundle
│       │   └── *.kext
│       ├── Filesystems/
│       │   └── *.fs
│       ├── Frameworks/
│       │   └── *.framework
│       ├── HIDPlugins  /
│       │   └── *.plugin
│       ├── MediaCapture/
│       │   └── *.mediacapture
│       ├── PrivateFrameworks/
│       │   └── *.framework
│       ├── QuickLook/
│       │   └── iWork.qlgenerator
│       ├── Spotlight/
│       │   └── iWork.mdimporter
│       ├── TextInput/
│       │   └── *.bundle
│       └── VideoProcessors/
│           └── CCPortrait.bundle
└── usr  /
    └── lib/
        ├── i18n/
        │   └── *.dylib
        ├── log/
        │   └── *.dylib
        ├── swift/
        │   └── *.dylib
        ├── system/
        │   └── *.dylib
        ├── updaters/
        │   └── *.dylib
        ├── usd/
        │   └── *.dylib
        ├── *.dylib
        └── dyld
```

Now for the file types:
- `dylib` - a shared library (similar to `dll` and `so` on Windows and Linux respectively.)
- `bundle` - a directory which is a container for whatever data required + some other files which contain metadata for the bundle.
- `framework` - a bundle which stores a shared library and its headers.
- `axbundle` - ??? (Also a bundle.)
- `mdimporter` - a bundle with metadata for the spotlight tool.
- `qlgenerator`- a bundle with the images/views used by spotlight.
- `mediacapture` - ??? (I assume it's some stuff used via the system to grant access to apps.)
- `fs` - a directory which contains tools to work with different filesystems (I assume they are also bundles).
- `kext` - a bundle which contains kernel extensions made using `IOKit`.
- `assistantBundle` and `siriUIBundle` - also bundle formats which contain extensions for siri.

The binary file `usr/lib/dyld` is the macOS dynamic linker.