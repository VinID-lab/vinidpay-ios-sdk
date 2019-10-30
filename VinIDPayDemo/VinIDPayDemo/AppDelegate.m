//
//  AppDelegate.m
//  VinIDPayDemo
//
//  Created by Huong Do on 10/25/19.
//  Copyright © 2019 VinID. All rights reserved.
//

#import "AppDelegate.h"
#import <VinIDPaySDK/VinIDPaySDK.h>

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[VinIDPay sharedInstance] setSandboxMode:YES];
    [[VinIDPay sharedInstance] setReturnURLScheme: @"com.vingroup.VinIDApp.Demo.vinidpay"];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [[VinIDPay sharedInstance] handleReturnURL:url];
}

// use this if app supports iOS 9
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[VinIDPay sharedInstance] handleReturnURL:url];
}

@end
