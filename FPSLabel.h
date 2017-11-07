#if DEBUG
#import <UIKit/UIKit.h>

/**
 Show Screen FPS...
 
 The maximum fps in OSX/iOS Simulator is 60.00.
 The maximum fps on iPhone is 59.97.
 The maxmium fps on iPad is 60.0.
 */
@interface FPSLabel : UILabel

@end

@interface LLWeakProxy:NSProxy

@property (nonatomic, weak, readonly, nullable) id target;

- (instancetype _Nullable )initWithTarget:(id _Nullable )target;

+ (instancetype _Nullable )proxyWithTarget:(id _Nullable)target;
@end
#endif
