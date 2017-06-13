//
//  AppDelegate.m
//  自定义TabBar
//
//  Created by MS on 15-9-25.
//  Copyright (c) 2015年 栾高垒. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [self changeStatusStyle];
    
    self.window.rootViewController = [self createTabBar];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (MyTabBarViewController *)createTabBar{
    
    ViewController1 *v1 = [[ViewController1 alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:v1];
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"菜谱" image:[UIImage imageNamed:@"菜谱-A"] selectedImage:[UIImage imageNamed:@"菜谱-B"]];
    
    ViewController1 *v2 = [[ViewController1 alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:v2];
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"发现-A"] selectedImage:[UIImage imageNamed:@"发现-B"]];
    
    ViewController1 *v3 = [[ViewController1 alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:v3];
    nav3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"广场" image:[UIImage imageNamed:@"广场-A"] selectedImage:[UIImage imageNamed:@"广场-B"]];
    
    ViewController1 *v4 = [[ViewController1 alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:v4];
    nav4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"我的-A"] selectedImage:[UIImage imageNamed:@"我的-B"]];
    
    MyTabBarViewController *myTabBarController = [[MyTabBarViewController alloc]init];
    myTabBarController.viewControllers = @[nav1, nav2, nav3, nav4];
    
    return myTabBarController;
}

- (void)changeStatusStyle{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
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
