# VinIDPay iOS SDK

VinIDPay iOS SDK helps you handle payments with VinID iOS app.

## Requirements
- Xcode 10+ and iOS 9.0+ Base SDK
- iOS 9.0+ deployment target

## Installation

#### Cocoapods

If your project doesn't have Cocoapods setup already, locate the project folder and run command:
```
pod init
```

Then add VinIDPaySDK to your podfile:
```
pod 'VinIDPayA2A'
```

Install or update your pods afterwards with command:
```
pod update
```

#### Manual Install

- Copy and embeded `VinIDPaySDK.framework` in your project.
- Since this is a universal framework, make sure to remove unused architectures from your app before releasing to AppStore.

## Sandbox Mode

If you wish to test the integration with VinID UAT app, you need to turn on sandbox mode. In your `AppDelegate` add the following:
```Swift
VinIDPay.sharedInstance.sandboxMode = true
```

The default value for `sandboxMode` is `false`.

## Setup for app switch

#### Update query scheme

To redirect users from your app to VinID App to start payment process, you must update your `Info.plist` file to support querying VinID App's scheme. The scheme is the app bundle ID, so if you use sandbox mode, make sure to add bundle ID of VinID UAT app also:

```
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>com.vingroup.VinIDApp</string>
    <string>com.one.oneid.UAT</string>
</array>
```

#### Register a URL type

To redirect users from VinID app to your app during payment process, you must register a URL type and configure your app to handle return URLs.

1. In Xcode, click on your project in the Project Navigator and navigate to App Target > Info > URL Types
2. Click [+] to add a new URL type
3. Under URL Schemes, enter your app switch return URL scheme. This scheme must start with your app's Bundle ID and be dedicated to VinID app switch returns. For example, if the app bundle ID is `com.your-company.Your-App`, then your URL scheme could be `com.your-company.Your-App.vinidpay`.

**IMPORTANT**: If you have multiple app targets, be sure to add the return URL type for all of the targets.

Then in your `AppDelegate`'s `application:didFinishLaunchingWithOptions:` implementation, use `setReturnURLScheme:` with the URL type you set above.

```Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    VinIDPay.sharedInstance.returnURLScheme = "com.your-company.Your-App.vinidpay"
    return true
}
```

#### Forward payment results

In your `AppDelegate`, make sure to pass the return URL to VinIDPay to handle payment results:

```Swift
func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    VinIDPay.sharedInstance.handleReturnURL(url)
    return true
}
```

If your app uses `SceneDelegate`, you must update the delegate to handle return URL:

```Swift
func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    for context in URLContexts {
        VinIDPay.sharedInstance.handleReturnURL(context.url)
    }
}
```

## Handle payments

To start payment process with VinID app, you need to have already created an order with VinID and got the id and signature for the order. Proceed the payment by sending them to VinIDPay:

```Swift
VinIDPay.sharedInstance.pay(orderId: id, signature: signature, extraData: nil) { (orderId, status) in
    switch status {
    case .success:
        print("payment successful!")
    case .aborted:
        print("user aborted payment")
    case .failure:
        print("payment failed")
    }
}
```

Make sure to update your app behavior based on payment results returned from VinIDPay SDK.

## Check for app install

If you need to check whether VinID app is installed in the device and ready for payment, check for `hasVinIDAppInstalled`:

```Swift
let hasInstalled = VinIDPay.sharedInstance.hasVinIDAppInstalled
```

## Navigate to AppStore

VinIDPay SDK also supports navigating user to AppStore:
```Swift
VinIDPay.sharedInstance.navigateToAppStore()
```

## Demo

You can find the example apps in Swift and Objective C in this repo to test the integration with VinIDPay.

To run it, run `pod install` and then open `.xcworkspace` file in Xcode.
