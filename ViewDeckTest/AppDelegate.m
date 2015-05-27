//
//  AppDelegate.m
//  ViewDeckTest
//
//  Created by mac on 15/5/26.
//  Copyright (c) 2015年 Cloudox. All rights reserved.
//

#import "AppDelegate.h"
#import "CenterViewController.h"
#import "IIViewDeckController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //中间视图
    CenterViewController *centerView = [[CenterViewController alloc] initWithNibName:@"CenterViewController" bundle:nil];
    //包装成Nav
    UINavigationController *centerNav = [[UINavigationController alloc]initWithRootViewController:centerView];
    //添加Nav左侧按钮
    centerView.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左侧" style:UIBarButtonItemStyleDone target:self action:@selector(toLeft)];
    //左、右视图
    LeftViewController *leftView = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    RightViewController *rightView = [[RightViewController alloc] initWithNibName:@"RightViewController" bundle:nil];
    //初始化ViewDeck
    self.deckController = [[IIViewDeckController alloc]initWithCenterViewController:centerNav leftViewController:leftView rightViewController:rightView];
    //设置左边视图显示时的宽度
    self.deckController.leftSize = self.window.frame.size.width - (250);
    //设置当滑动到左右边时，中间视图对点击的响应————————————————————————
    //1.默认设置，点击中间界面不会返回中间界面，中间界面控件有响应
//    self.deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenUserInteractive;
    
    //2.点击中间界面任何地方无作用，中间界面控件不响应
//    self.deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractive;
    
    //3.点击中间任何地方可返回中间界面，中间界面控件不响应
    self.deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    
    //4.点击中间界面任何地方可弹回中间界面，中间界面控件不响应
//    self.deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToCloseBouncing;
    //————————————————————————————————————————————————————————————
    self.window.rootViewController = self.deckController;
    return YES;
}

- (void)toLeft {
    //两种方式打开一个界面
//    [self.deckController toggleLeftViewAnimated:YES];//直接打开
    //判断是否打开，做出不同响应
    if ([self.deckController isSideOpen:IIViewDeckLeftSide]) {
        [self.deckController closeLeftView];
    }
    else {
        [self.deckController openLeftView];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
