#if DEBUG
#import "LL_Debug.h"
#import "FPSLabel.h"


@interface LL_Debug()
@property (nonatomic, strong) UILabel *debugLabel;
@property (nonatomic, strong) FPSLabel *fpsLabel;
@property (nonatomic, strong) UIView *debugCView;
@end

@implementation LL_Debug

+ (instancetype)shareInstance
{
    static LL_Debug *debug = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        debug = [LL_Debug new];
    });
    return debug;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.customNote = @"    当前控制器：";
        self.textColor =  [UIColor colorWithRed:53.0 / 255 green:205.0 / 255 blue:73.0 / 255 alpha:1.0];
        FPSLabel *fpsLabel = [FPSLabel new];
        fpsLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 55, 0, 55, 20);
        [self.debugView addSubview:fpsLabel];
        [self.debugView addSubview:self.noteLabel];
    }
    return self;
}
- (UILabel *)noteLabel
{
    if (!_debugLabel) {
        //FPSlabel的宽度为55
        _debugLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 55, 20)];
        _debugLabel.textColor = _textColor;
        _debugLabel.adjustsFontSizeToFitWidth = YES;
        _debugLabel.minimumScaleFactor = 0.5;
        _debugLabel.font = [UIFont systemFontOfSize:14];
        _debugLabel.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5f];
    }
    return _debugLabel;
}
- (UIView *)debugView
{
    if (!_debugCView) {
        CGFloat y = 20;
        if ([UIScreen mainScreen].bounds.size.height == 812) {
            y = 34;
        }
        _debugCView = [[UIView alloc] initWithFrame:CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, 20)];
    }
    if (!_debugCView.superview) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        if (window) {
            [window addSubview:_debugCView];
        }
    }
    return _debugCView;
}
@end
#endif
