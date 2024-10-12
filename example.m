///
///  Example from `objc-runtime.md`
///

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


int main() {    
    @autoreleasepool {
        ExampleClass *example = [[ExampleClass alloc] init];
        NSLog(@"The content of example is: %@\n", [example get_content]);
    }
    return 0;
}