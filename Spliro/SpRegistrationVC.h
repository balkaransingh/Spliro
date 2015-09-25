//
//  SpRegistrationVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "SpAuthenticationVC.h"
#import "MBProgressHUD.h"
#import "Validate.h"
#import "Reachability.h"
#import "Api_key.h"
#import "Macros.h"

@interface SpRegistrationVC : UIViewController<UITextFieldDelegate>
{
    BOOL isLogin;
    BOOL isLoginFacebook;
    NSString *mobileNumber,*email,*reg_id,*facebook_user_id,*facebook_access_token;
}
- (IBAction)btnBackDidClicked:(id)sender;
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) IBOutlet UIScrollView *registrationScrollView;
@property (strong, nonatomic) IBOutlet UITextField *txt_firstName;
@property (strong, nonatomic) IBOutlet UITextField *txt_EmailId_phone_no;
@property (strong, nonatomic) IBOutlet UITextField *txt_retypePassword;
@property (strong, nonatomic) IBOutlet UILabel *lblTermCondition;
@property (strong, nonatomic) IBOutlet UITextField *txt_LastName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_or;
@property (strong, nonatomic) IBOutlet UITextField *txt_password;
- (IBAction)btnJoinDidClicked:(id)sender;
- (IBAction)btnCheckDidClicked:(id)sender;
-(void)RegisterTheUserWithName:(NSString *)paramFirstName lastName:(NSString *)paramLastName emailOrPhone:(NSString *)paramEmailOrPhone password:(NSString *)paramPassword;
@property (strong, nonatomic) IBOutlet UIImageView *imageLogo;
@property (strong, nonatomic) IBOutlet UIButton *btnTermAndCondition;
- (IBAction)btnFacebookDidClicked:(id)sender;
@property (strong, nonatomic) FBSDKLoginManager *login;
@property (strong, nonatomic) FBSDKAccessToken *loginToken;
@end
