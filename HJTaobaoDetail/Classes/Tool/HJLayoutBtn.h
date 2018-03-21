//
//  HJLayoutBtn.h
//  HJLayoutBtn
//
//  Created by 胡俊杰 on 2016/10/5.
//  Copyright © 2016年 胡俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,HJLaoutBtnStyle){
    HJLaoutBtnStyleImageLeft,
    HJLaoutBtnStyleImageRight,
    HJLaoutBtnStyleImageUp,
    HJLaoutBtnStyleImageDown
};
@interface HJLayoutBtn : UIButton
/**样式*/
@property (nonatomic,assign)HJLaoutBtnStyle HJ_Style;

/**图片与文字的间距，默认为5*/
@property (nonatomic,assign)CGFloat HJ_Spacing;
@end
