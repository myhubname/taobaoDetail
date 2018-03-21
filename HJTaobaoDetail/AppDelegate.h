//
//  AppDelegate.h
//  HJTaobaoDetail
//
//  Created by 嘉瑞科技有限公司 on 2018/3/21.
//  Copyright © 2018年 嘉瑞科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

