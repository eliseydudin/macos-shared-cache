///
///  Example from `objc-runtime.md` but in Swift
///  Used to check how Swift classes are stored in `.dylib`s
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