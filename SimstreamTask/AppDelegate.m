//
//  AppDelegate.m
//  SimstreamTask
//
//  Created by Cybraum on 12/21/16.
//  Copyright © 2016 Cybraum. All rights reserved.
//

#import "AppDelegate.h"
#import "HostViewController.h"
#import "firstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self tabbaraction];
    self.window.rootViewController=_tabBarController;
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
-(void)tabbaraction
{
    HostViewController *viewController1;
    firstViewController *viewController2;
    SecondViewController *viewController3;
    ThirdViewController *viewController4;
    FourthViewController *viewController5;
    
    
    
    
    viewController1 = [[HostViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    viewController2=[[firstViewController alloc]initWithNibName:@"firstViewController" bundle:nil];
    viewController3 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    viewController4=[[ThirdViewController alloc]initWithNibName:@"ThirdViewController" bundle:nil];
    viewController5=[[FourthViewController alloc]initWithNibName:@"FourthViewController" bundle:nil];
    
    navigation1=[[UINavigationController alloc] initWithRootViewController:viewController1];
    navigation2=[[UINavigationController alloc] initWithRootViewController:viewController2];
    navigation3=[[UINavigationController alloc] initWithRootViewController:viewController3];
    navigation4=[[UINavigationController alloc] initWithRootViewController:viewController4];
    navigation5=[[UINavigationController alloc] initWithRootViewController:viewController5];
    
    
    self.tabBarController.delegate=self;
    self.tabBarController=[[UITabBarController alloc]init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigation1,navigation2,navigation3,navigation4,navigation5, nil];
    
}

@end
