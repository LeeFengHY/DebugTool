/**
 在Appdelegate中确保window初始化并制定了rootViewController
 在项目中使用DEBUG宏控制是否弹出调试信息
 DEBUG = 1
 debug:该模式下回显示调试信息
 
 DEBUG = 0
 release:该模式下不会显示调试信息
 */

#if DEBUG
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LL_Debug : NSObject

/**
 自定义调试显示信息
 */
@property (nonatomic, copy) NSString *customNote;

/**
 自定义调试信息颜色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 显示信息label
 */
@property (nonatomic, strong) UILabel *noteLabel;

/**
 显示调试信息View
 */
@property (nonatomic, strong) UIView *debugView;
/**
 调试器单例

 @return self
 */
+ (instancetype)shareInstance;


@end
#endif
