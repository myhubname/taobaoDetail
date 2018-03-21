//
//  BasicNavController.m
//  CustomFramework
//
//  Created by 胡俊杰 on 2016/12/16.
//  Copyright © 2016年 胡俊杰. All rights reserved.
//

#import "BasicNavController.h"

@interface BasicNavController ()<UIGestureRecognizerDelegate>

@end

@implementation BasicNavController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self)weakself = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakself;
        
    }
   
    // Do any additional setup after loading the view.
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
        
    }
}

//可以在这个方法中拦截所有push进来的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 如果push进来的不是第一个控制器
    if (self.childViewControllers.count>0)
    {
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        //设置button的水平偏移,让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [button sizeToFit];
        button.contentEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);
        [button setImage:[UIImage imageNamed:@"return_backRow"] forState:UIControlStateNormal];
        [button setTitle:viewController.title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:viewController.title forState:UIControlStateNormal];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];

        viewController.hidesBottomBarWhenPushed=YES;
    }
    //这句super的push要放在后面，让viewcontroller可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}
-(void)back
{
    [self popViewControllerAnimated:YES];
}


@end
