#import "SceneDelegate.h"
#import <VinIDPaySDK/VinIDPaySDK.h>

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    for (UIOpenURLContext* context in URLContexts.allObjects) {
        [[VinIDPay sharedInstance] handleReturnURL:context.URL];
    }
}

@end
