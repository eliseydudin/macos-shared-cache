# /System/Library
Directories:
- `Accounts` - ???
- `Assistant` - ??? (Probably some Siri stuff.)
- `CoreServices` - ???
- `Extensions` - system extensions (`bundle`s and `kext`s).
- `Filesystems` - access to different filesystems (`fs` files).
- `Frameworks` - frameworks for apps (`framework`s and strangely enough `dylib`s). 
- `HIDPlugins` - ???
- `MediaCapture` - ???
- `PrivateFrameworks` - frameworks which shouldn't be accessed by the developer.
- `QuickLook` - extensions for QuickLook. The only `bundle` on there is `iWork.qlgenerator`, it is used by QuickLook to access files generated by Apple's office programs.
- `Spotlight` - ???
- `TextInput` - ??? (I assume that it has extensions for macOS which help with user input from different languages.)
- `VideoProcessors` - ???

The most important directory here is `Frameworks` since they contain everything used by any other app.