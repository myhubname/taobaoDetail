//
//  Header.h
//  HJTaobaoDetail
//
//  Created by 嘉瑞科技有限公司 on 2018/3/21.
//  Copyright © 2018年 嘉瑞科技有限公司. All rights reserved.
//
#ifdef __OBJC__

#ifndef Header_h
#define Header_h
#import "WRNavigationBar.h"
#import <Masonry.h>
#import "HJLayoutBtn.h"
#import "HJBaseTableView.h"

//设置随机颜色
#define HJRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define HJRGBAColor(r, g, b, a) [UIColor colorWithDisplayP3Red:(r)/255.0 green:(g)/255.0 blue:(b)/255.0  alpha:a]
#define HJColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0alpha:1.0]

//获取屏幕宽度与高度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN [UIScreen mainScreen].bounds
#define kScaleLength(length) (length) * [UIScreen mainScreen].bounds.size.width / 320.0f
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavBarHeight 44.0
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define TopHeight (StatusBarHeight + NavBarHeight)


//关闭scrollView会默认把scrollView的显示往下移动64
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


#endif /* Header_h */
#endif
