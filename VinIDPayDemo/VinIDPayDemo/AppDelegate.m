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


#pragma mark - UISceneSession lifecycleVinIDPaySDK.framework


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [[VinIDPay sharedInstance] handleReturnURL:url];
}

@end
