//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by Huong Do on 10/27/19.
//  Copyright © 2019 VinID. All rights reserved.
//

import UIKit
import VinIDPaySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // important: set return URLScheme to get callback when payment completes
        VinIDPay.sharedInstance.sandboxMode = true
        VinIDPay.sharedInstance.returnURLScheme = "com.vingroup.VinIDApp.ExampleApp.vinidpay"
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VinIDPay.sharedInstance.handleReturnURL(url)
        return true
    }
}

