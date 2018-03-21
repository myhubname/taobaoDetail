//
//  HJDetailTopView.h
//  Passersbyjun
//
//  Created by 嘉瑞科技有限公司 on 2018/3/20.
//  Copyright © 2018年 嘉瑞科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HJdetailTopViewDelegate<NSObject>


-(void)gotoScroollerAndTitle:(NSString *)title;

@end
@interface HJDetailTopView : UIView

@property(nonatomic,copy) NSArray *topArr;

@property(nonatomic,copy) NSString *selectedStr;

@property(nonatomic,assign) CGFloat alphScroller;

/*代理*/
@property(nonatomic,weak)id<HJdetailTopViewDelegate> delegate;


@end
