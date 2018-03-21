//
//  HJBaseTableView.m
//  Haoindustry
//
//  Created by 嘉瑞科技有限公司 on 2017/9/28.
//  Copyright © 2017年 嘉瑞科技有限公司. All rights reserved.
//

#import "HJBaseTableView.h"

@implementation HJBaseTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        
        if (@available(iOS 11.0, *)) {
        
            self.estimatedRowHeight = 0;
            self.estimatedSectionHeaderHeight = 0;
            self.estimatedSectionFooterHeight = 0;
        }

    }
    return self;
}


@end
