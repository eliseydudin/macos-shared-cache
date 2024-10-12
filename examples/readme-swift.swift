///
///  Example from `objc-runtime.md` but in Swift
///  Used to check how Swift classes are stored in `.dylib`s
/// 
///  After checking via `nm` it appears that Swift classes are stored 
///  pretty much the same as in Objective C, the only difference is that
///  Swift classes are mangled to prevent duplicate symbols.
/// 
///  Example (ObjC -> Swift):
///  `_OBJC_CLASS_$_ExampleClass` -> `_OBJC_CLASS_$__TtC4main12ExampleClass`
/// 

import Foundation

class ExampleClass: NSObject {
    var content: NSString!

    override public init() {
        super.init()
        self.content = "Hello!"
    }

    public func get_content() -> NSString {
        return self.content
    }

    public func set_content(str: NSString) {
        self.content = str
    }
}

let example = ExampleClass()
NSLog("%@", example.get_content())