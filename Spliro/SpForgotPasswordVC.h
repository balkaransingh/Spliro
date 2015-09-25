//
//  SpForgotPasswordVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
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


@interface SpForgotPasswordVC : UIViewController<UITextFieldDelegate>
{
    NSString *mobileNumber,*email;
}
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UIImageView *ImageLogo;
@property (strong, nonatomic) IBOutlet UITextField *txt_EmailID_phone_no;
@property (strong, nonatomic) IBOutlet UIButton *btnSubmitDidClicked;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Forgotpassword;
- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnSubmitDidClicked:(id)sender;

@end
