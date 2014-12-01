//
//  AppDelegate.m
//  UsingXibCreateController
//
//  Created by Hannibal Yang on 12/1/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "MySecondViewController.h"
#import "MyThirdViewController.h"
#import "MyFourthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    MySecondViewController *second = [[MySecondViewController alloc] initWithNibName:@"MySecondViewController" bundle:nil];
//    self.window.rootViewController = second;
    
//    MyThirdViewController *third = [[MyThirdViewController alloc] initWithNibName:@"MyThirdViewController" bundle:nil];
//    self.window.rootViewController = third;
//    MyFourthViewController *fourth = [[MyFourthViewController alloc] initWithNibName:@"MyFourthViewController" bundle:nil];
//    self.window.rootViewController = fourth;
    
    // 如果调用init方法创建控制器（MyFourthViewController），那么在加载控制器view的时候：
    // 1. 优先查找“MyFourthView.xib”
    // 2. 其次再查找同名的xib文件“MyFourthViewController.xib”
    // 3. 如果没有找到上述的xib文件，会直接通过代码创建一个空白的view
    // 控制器的init方法默认会去寻找跟控制器同名的xib文件
    self.window.rootViewController = [[MyFourthViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    return YES;
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
