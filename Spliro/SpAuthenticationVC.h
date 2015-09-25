//
//  SpAuthenticationVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpTabBarControllerVC.h"
#import "Api_key.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "SpTabBarControllerVC.h"
#import "Macros.h"

@interface SpAuthenticationVC : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) SpTabBarControllerVC *tabbarcontroller;
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UIButton *btnBackDidClicked;
@property (strong, nonatomic) IBOutlet UIImageView *imageLOgo;
@property (strong, nonatomic) IBOutlet UITextField *txt_autheticatioCode;
- (IBAction)btnResendPinDidClicked:(id)sender;
- (IBAction)btnActivateAccountDidClicked:(id)sender;
- (IBAction)btnBackDidClicked:(id)sender;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *reg_id;
@end
