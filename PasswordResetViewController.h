//
//  PasswordResetViewController.h
//  Spliro
//
//  Created by Deepti on 03/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"
#import "Constants.h"
#import "Reachability.h"
#import "Api_key.h"
#import "Macros.h"
#import "Validate.h"
#import "MBProgressHUD.h"
#import "SpLogInVC.h"

@interface PasswordResetViewController : UIViewController
{
    BOOL isSucess;
}
@property (strong, nonatomic) IBOutlet UITextField *EnterPassword_TextField;
@property (strong, nonatomic) IBOutlet UITextField *ReEnterPassword_TextField;
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) IBOutlet UITextField *OTP_TextField;

- (IBAction)submit_Button:(UIButton *)sender;
@end
