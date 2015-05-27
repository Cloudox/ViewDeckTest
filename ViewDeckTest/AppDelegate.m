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
    CenterViewController *centerView = [[CenterViewController alloc] initWithNibName:@"CenterViewController" bundle:nil];
    UINavigationController *centerNav = [[UINavigationController alloc]initWithRootViewController:centerView];
    centerView.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左侧" style:UIBarButtonItemStyleDone target:self action:@selector(toLeft)];
    LeftViewController *leftView = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    RightViewController *rightView = [[RightViewController alloc] initWithNibName:@"RightViewController" bundle:nil];
    self.deckController = [[IIViewDeckController alloc]initWithCenterViewController:centerNav leftViewController:leftView rightViewController:rightView];
    self.deckController.leftSize = self.window.frame.size.width - (250);
    self.deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    self.window.rootViewController = self.deckController;
    return YES;
}

- (void)toLeft {
//    [self.deckController toggleLeftViewAnimated:YES];
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
