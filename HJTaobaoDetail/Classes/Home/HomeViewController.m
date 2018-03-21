//
//  HomeViewController.m
//  HJTaobaoDetail
//
//  Created by 嘉瑞科技有限公司 on 2018/3/21.
//  Copyright © 2018年 嘉瑞科技有限公司. All rights reserved.
//

#import "HomeViewController.h"
#import "HJDetailViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"去详情" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.offset(0);
        make.width.offset(100);
        make.height.offset(45);
    }];
    
}

-(void)gotoDetail
{
    
    [self.navigationController pushViewController:[[HJDetailViewController alloc] init] animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
