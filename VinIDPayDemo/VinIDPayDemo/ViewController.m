//
//  ViewController.m
//  VinIDPayDemo
//
//  Created by Huong Do on 10/25/19.
//  Copyright © 2019 VinID. All rights reserved.
//

#import "ViewController.h"
#import <VinIDPaySDK/VinIDPaySDK.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *orderIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *signatureTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)proceedPayment:(id)sender {
    [self.view endEditing:YES];
    [[VinIDPay sharedInstance] payWithOrderId:self.orderIdTextField.text signature:self.signatureTextField.text extraData:nil completionHandler:^(NSString *orderId, VinIDPayStatus status) {
        
        NSString *message = @"";
        
        switch (status) {
            case VinIDPayStatusAborted:
                message = @"payment aborted";
                break;
            
            case VinIDPayStatusFailure:
                message = @"payment failed";
                break;
                
            case VinIDPayStatusSuccess:
                message = @"payment successful";
                break;
        }
        
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [controller addAction:cancelAction];
        [self presentViewController:controller animated:YES completion:nil];
    }];
}

@end
