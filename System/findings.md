# Findings /System

`/System` is one of the root directories. It contains stuff used by the system which shouldn't be changed. For example if you go to `/System/Library/Frameworks` you'd find a lot of framework bundles which have all the headers and have a broken symbolic link to their dynamic libraries.

Directories:
- `iOSSupport` - contains tools which can be used to interact with iOS. 
- `Library` - as described previously it contains the assets used by the system.

