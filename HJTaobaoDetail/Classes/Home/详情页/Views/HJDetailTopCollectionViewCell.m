//
//  HJDetailTopCollectionViewCell.m
//  Passersbyjun
//
//  Created by 嘉瑞科技有限公司 on 2018/3/20.
//  Copyright © 2018年 嘉瑞科技有限公司. All rights reserved.
//

#import "HJDetailTopCollectionViewCell.h"


@implementation HJDetailTopCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self creatUI];
    }
    return self;
}

-(void)creatUI
{
    HJLayoutBtn *btn = [HJLayoutBtn buttonWithType:UIButtonTypeCustom];
    [btn setImage:nil forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:HJRGBAColor(230, 84, 0, 1.0) forState:UIControlStateDisabled];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.bottom.offset(0);
    }];
    self.btn = btn;
}




@end
