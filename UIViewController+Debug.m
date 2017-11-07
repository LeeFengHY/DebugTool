#if DEBUG

#import "UIViewController+Debug.h"
#import <objc/runtime.h>
#import "LL_Debug.h"

@implementation UIViewController (Debug)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method myViewWillAppear = class_getInstanceMethod(self, @selector(myViewWillAppear:));
        Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
        method_exchangeImplementations(viewWillAppear, myViewWillAppear);
        
        Method myDealloc = class_getInstanceMethod(self, @selector(myDealloc));
        Method dealloc = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        method_exchangeImplementations(dealloc, myDealloc);
    });
}
- (BOOL)isPrivateVC
{
    NSString *selfClass = NSStringFromClass(self.class);
    return [selfClass isEqualToString:@"UIAlertController"] ||
    [selfClass isEqualToString:@"_UIAlertControllerTextFieldViewController"] ||
    [selfClass isEqualToString:@"UIApplicationRotationFollowingController"] ||
    [selfClass isEqualToString:@"UIInputWindowController"];
}
- (void)myViewWillAppear:(BOOL)animation
{
    if (![self isPrivateVC]) {
        UIView *debugView = LL_Debug.shareInstance.debugView;
        UILabel *debugLabel = LL_Debug.shareInstance.noteLabel;
        if (debugView.superview) {
            [debugView.superview bringSubviewToFront:debugView];
        }
        if (LL_Debug.shareInstance.customNote == nil) {
            LL_Debug.shareInstance.customNote = @"    ";
        }
        debugLabel.text = [NSString stringWithFormat:@"%@%@",LL_Debug.shareInstance.customNote,[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject];
    }
    [self myViewWillAppear:animation];
}
- (void)myDealloc
{
    NSLog(@">>>>>>>>>>%@ 已经释放了<<<<<<<<<<",[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject);
    [self myDealloc];
}
@end
#endif
