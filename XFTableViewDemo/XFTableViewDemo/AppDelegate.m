//
//  AppDelegate.m
//  XFTableViewDemo
//
//  Created by 左晓峰 on 2018/10/31.
//  Copyright © 2018年 zxfmpy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = rootNav;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    return YES;
}

@end
