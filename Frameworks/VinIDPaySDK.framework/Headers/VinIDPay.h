//
//  VinIDPay.h
//  VinIDPaySDK
//
//  Created by Huong Do on 10/27/19.
//  Copyright © 2019 VinID. All rights reserved.
//

#import <Foundation/Foundation.h>

#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSInteger, VinIDPayStatus) {
  VinIDPayStatusAborted = 0,
  VinIDPayStatusFailure = 1,
  VinIDPayStatusSuccess = 2,
};

@interface VinIDPay : NSObject

SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) VinIDPay * _Nonnull sharedInstance;)
+ (VinIDPay * _Nonnull)sharedInstance;

@property (nonatomic) BOOL sandboxMode;
@property (nonatomic, copy) NSString * _Nullable returnURLScheme;

- (void)payWithOrderId:(NSString * _Nonnull)orderId signature:(NSString * _Nonnull)signature completionHandler:(void (^ _Nonnull)(NSString * _Nonnull, enum VinIDPayStatus))completionHandler;

- (BOOL)handleReturnURL:(NSURL * _Nonnull)url NS_SWIFT_NAME(handleReturnURL(_:));

@end


NS_ASSUME_NONNULL_END
