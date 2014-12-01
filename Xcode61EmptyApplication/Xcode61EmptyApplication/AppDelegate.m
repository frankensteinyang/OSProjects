//
//  AppDelegate.m
//  Xcode61EmptyApplication
//
//  Created by Hannibal Yang on 12/1/14.
//  Copyright (c) 2014 Hannibal Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "MyFirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/*
UIViewController
 1.控制器内部的view是延迟加载
 1> 用到时再加载
 2> 加载完毕后会调用控制器的viewDidLoad方法
 
 2.创建控制器的方式
 1> 直接通过代码创建
 MyFirstViewController *first = [[MyFirstViewController alloc] init];
 
 2> 通过storyboard创建控制器
 * 加载storyboard文件
 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MyFirstStoryboard" bundle:nil];
 * 从storyboard中创建控制器
 // 根据控制器在storyboard文件中storyboard id来创建
MyFirstViewController *first = [storyboard instantiateViewControllerWithIdentifier:@"FrankensteinID"];
 // 直接创建箭头所指的控制器（initial controller）
  MyFirstViewController *first = [storyboard instantiateInitialViewController];
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
    
//    UIViewController *vc = [[UIViewController alloc] init];
//    MyFirstViewController *first = [[MyFirstViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
//    first.view.backgroundColor = [UIColor blueColor];
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    btn.center = CGPointMake(100, 100);
//    [vc.view addSubview:btn];
//    [first.view addSubview:btn];
    
    // Xcode 3 之后苹果官方推荐用根控制器
//    self.window.rootViewController = vc;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MyFirstStoryboard" bundle:nil];
    
//    MyFirstViewController *first = [storyboard instantiateViewControllerWithIdentifier:@"StoryboardID"];
//    MyFirstViewController *first = [storyboard instantiateViewControllerWithIdentifier:@"FrankensteinID"];
    // 直接创建箭头所指的控制器对象
    MyFirstViewController *first = [storyboard instantiateInitialViewController];
    
    self.window.rootViewController = first;
//    [self.window addSubview:vc.view];
    
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
