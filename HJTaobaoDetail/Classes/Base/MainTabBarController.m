//
//  MainTabBarController.m
//  CustomFramework
//
//  Created by 胡俊杰 on 2016/12/16.
//  Copyright © 2016年 胡俊杰. All rights reserved.
//

#import "MainTabBarController.h"
#import "BasicNavController.h"
#import "HomeViewController.h"
@interface MainTabBarController ()<UITabBarControllerDelegate>


@end

@implementation MainTabBarController
+(void)initialize
{
    NSMutableDictionary *attrd=[NSMutableDictionary dictionary];
    attrd[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    attrd[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    NSMutableDictionary *selectedattrd=[NSMutableDictionary dictionary];
    selectedattrd[NSFontAttributeName]=attrd[NSFontAttributeName];
    selectedattrd[NSForegroundColorAttributeName]= [UIColor orangeColor];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    UITabBarItem *itm=[UITabBarItem appearance];
    [itm setTitleTextAttributes:attrd forState:UIControlStateNormal];
    [itm setTitleTextAttributes:selectedattrd forState:UIControlStateSelected];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    [self setupChild:[[HomeViewController alloc] init] title:@"主页" image:@"" selectedImage:@""];
    
   
    [self setNavBarAppearence];

}
-(void)setupChild:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title=title;
    vc.tabBarItem.image= [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage=[UIImage imageNamed:selectedImage];
    vc.tabBarItem.selectedImage=[vc.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BasicNavController *NavVc = [[BasicNavController alloc] initWithRootViewController:vc];
    [self addChildViewController:NavVc];
}
- (void)setNavBarAppearence
{
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:[UIColor whiteColor]];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor blackColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor blackColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleDefault];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:NO];
}





@end
