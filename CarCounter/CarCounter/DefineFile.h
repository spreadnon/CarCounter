//
//  DefineFile.h
//  CarCounter
//
//  Created by iOS123 on 2019/5/28.
//  Copyright © 2019 jeremy. All rights reserved.
//

#ifndef DefineFile_h
#define DefineFile_h


/**** UI尺寸 ****/
//获取屏幕宽度与高度
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
//根据6，7，8适配
#define ScaleWidth(width) (width / 375.0) * SCREEN_WIDTH
#define ScaleHeight(height) (height / 667.0) * SCREENH_HEIGHT
//是否是iPhoneX
#define k1IS_iPhoneX (SCREEN_WIDTH == 375.f && SCREENH_HEIGHT == 812.f)
#define k2IS_iPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否为X系列
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\

// 状态栏高度
#define kStatusBarHeight        (IPHONE_X ? 44.f : 20.f)
// 顶部导航栏高度
#define kNavigationBarHeight    44.f
// 顶部安全距离
#define kSafeAreaTopHeight      (IPHONE_X ? 88.f : 64.f)
// 底部安全距离
#define kSafeAreaBottomHeight   (IPHONE_X ? 34.f : 0.f)
// Tabbar高度
#define kTabbarHeight           49.f
// 去除上下导航栏剩余中间视图高度
#define ContentHeight           (kScreenHeight - kSafeAreaTopHeight - kSafeAreaBottomHeight - kTabbarHeight)


/**** 颜色 ****/
//随机颜色
#define ZBRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//RGB
#define ZBRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//RGBA
#define ZBRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
//十六进制颜色
#define ZBRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//十六进制颜色，透明度
#define ZBRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

/**** 系统相关 ****/
//app版本号
#define DEVICE_APP_VERSION      (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
//app Build版本号
#define DEVICE_APP_BUILD        (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//系统版本号（string）
#define DEVICE_OS_VERSION       [[UIDevice currentDevice] systemVersion]
//系统版本号（float）
#define DEVICE_OS_VERSION_VALUE [DEVICE_OS_VERSION floatValue]
//检测是否是竖屏状态
#define IsPortrait ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)

/**** 沙盒目录文件 ****/
//temp
#define ZBPathTemp NSTemporaryDirectory()
//Document
#define ZBPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//Cache
#define ZBPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

/**** 数据判空 ****/
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/**** 常用缩写 ****/
#define kApplication            [UIApplication sharedApplication]
#define kKeyWindow              [UIApplication sharedApplication].keyWindow
#define kAppDelegate            [UIApplication sharedApplication].delegate
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kNotifCenter            [NSNotificationCenter defaultCenter]

/**** 其他 ****/
//弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define ZBWeak __weak typeof(self) weakSelf = self;
#define ZBWeakSelf(type)  __weak typeof(type) weak##type = type;
//强引用
#define ZBStrongSelf(type) __strong typeof(type) type = weak##type;

//角度转换弧度
#define ZBDegreesToRadian(x) (M_PI * (x) / 180.0)
//弧度转换角度
#define ZBRadianToDegrees(radian) (radian*180.0)/(M_PI)

//block判空回调
#define ZBBlockNotEmpt(block, ...)  if (block) { block(__VA_ARGS__); }

//.h头文件中的单例宏
#define ZBSingletonH(name) + (instancetype)shared##name;

//.m文件中的单例宏
#define ZBSingletonM(name) \
static id _instance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
+ (instancetype)shared##name{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc] init];\
});\
return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone{\
return _instance;\
}




#endif /* DefineFile_h */
