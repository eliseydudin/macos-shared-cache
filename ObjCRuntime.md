# \[ObjC\] Runtime
During the days of NeXTSTEP NeXT's engineers started developing Objective-C to bring OOP to C.  
Essentially Objective-C is an abstraction over C which adds a dynamic runtime, so instead of creating a new language it uses a pre-processor and links a special library (`/usr/lib/libobjc.A.dylib`).

# The Syntax
Since the original compiler for Objective-C was just a preprocessor, NeXT's engineers had to create some ugly syntax which wouldn't conflict with C.
For example, here's a simple `Cocoa` example:
```objc
#import <Foundation/Foundation.h>

@interface ExampleClass: NSObject
@property (strong, nonatomic) NSString *content;

-(NSString *) get_content;
-(void) set_content:(NSString *)new_content;

@end

@implementation ExampleClass 

-(instancetype) init {
    if (self = [super init]) {
        self.content = @"Hello!"; 
    }
    return self;
}

-(NSString *) get_content {
    return self.content;
}

-(void) set_content:(NSString *)new_content {
    self.content = new_content;
}

@end

...

int main() {    
    @autoreleasepool {
        ExampleClass *example = [[ExampleClass alloc] init];
        NSLog(@"The content of example is: %@\n", [example get_content]);
    }
    return 0;
}

```

Now to explain what you have just seen:
- `#import` works just like `#include` in normal C, however it automatically adds `#pragma once` to the included file to omit include errors.
- `@interface` creates an ObjC class.
- `@property` defines a class/instance property with the given flags.
- Methods in this language look like this: `+/- (return_type)method_name:(type1)param1 method_name2:(type2)param2;`. "+" means that the method is static and "-" means that the method is object specific.
- `@end` ends the interface/protocol/implementation definition
- Calling methods in objc follows the form of `[object method_name1:param1 method_name2:param2]`.
- `@autoreleasepool` creates a scope in which all objects defined are deallocated.

# The Runtime
If you were to try to compile the code above using `clang` (which doesn't automatically link the executable with the objc runtime library) you'd get the following output:
```
Undefined symbols for architecture arm64:
  "_NSLog", referenced from:
      _main in test-5abaf0.o
  "_OBJC_CLASS_$_NSObject", referenced from:
      _OBJC_CLASS_$_ExampleClass in test-5abaf0.o
  "_OBJC_METACLASS_$_NSObject", referenced from:
      _OBJC_METACLASS_$_ExampleClass in test-5abaf0.o
      _OBJC_METACLASS_$_ExampleClass in test-5abaf0.o
  "___CFConstantStringClassReference", referenced from:
       in test-5abaf0.o
       in test-5abaf0.o
  "__objc_empty_cache", referenced from:
      _OBJC_CLASS_$_ExampleClass in test-5abaf0.o
      _OBJC_METACLASS_$_ExampleClass in test-5abaf0.o
  "_objc_alloc_init", referenced from:
      _main in test-5abaf0.o
  "_objc_autoreleasePoolPop", referenced from:
      _main in test-5abaf0.o
  "_objc_autoreleasePoolPush", referenced from:
      _main in test-5abaf0.o
  "_objc_msgSend", referenced from:
      -[ExampleClass init] in test-5abaf0.o
      -[ExampleClass get_content] in test-5abaf0.o
      -[ExampleClass set_content:] in test-5abaf0.o
      _main in test-5abaf0.o
  "_objc_msgSendSuper2", referenced from:
      -[ExampleClass init] in test-5abaf0.o
  "_objc_setProperty_nonatomic", referenced from:
      -[ExampleClass setContent:] in test-5abaf0.o
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

The explaination lies in the objc runtime mentioned at the start of this document.
This runtime was written in C and its headers can be accessed after installing XCode.

The runtime relies on the following types:

- `Class` - a pointer which contains data about the class (methods, properties, etc.)
- `id` - a pointer which is the object itself (all pointers in C/C++/ObjC are all the same).
- `SEL` - selector, or the name of the method.
- `Ivar` - instance variable.

Since Objc is an OOP language it relies on "Messages" (or methods) hence the function `objc_msgSend`. It is defined in `message.h` as `void objc_msgSend(void)`, for it to work it has to be converted to an appropriate function pointer type, example for a function like `[NSObject alloc]`: `id (*)(Class, SEL)`. 

All classes are defined as static variables in dynamic libraries in the format of `_OBJC_CLASS_$_CLASSNAME`. For example, the class `NSObject` is defined as `_OBJC_CLASS_$_NSObject` and is located in `usr/lib/libobjc.A.dylib`.

The ObjC runtime has many functions, if you need more examples you can find them [here](https://gist.github.com/hasenj/1bba3ca00af1a3c0b2035c9bd14a85ef).