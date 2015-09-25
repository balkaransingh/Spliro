//
//  SpLogInVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "MBProgressHUD.h"
#import "Validate.h"
#import "Reachability.h"
#import "Macros.h"
#import "Api_key.h"
#import "PasswordResetViewController.h"
@interface SpLogInVC : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>
{
    NSString *email_id,*mobileNumber,*email,*facebook_user_id,*facebook_access_token;
    NSMutableDictionary *d;
    NSMutableArray *list_cagtegories,*list;
}
@property (strong, nonatomic) IBOutlet UIScrollView *loginScrollview;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UIImageView *imageLogo;
@property (strong, nonatomic) IBOutlet UILabel *lbl_or;
@property (strong, nonatomic) IBOutlet UITextField *txt_emilID_phone_no;
- (IBAction)btnForgotPasswordDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_password;
- (IBAction)btnLoginDidClicked:(id)sender;
- (IBAction)btnFacebookDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *fb_view;
@property (strong, nonatomic) IBOutlet UIImageView *image_fb;
- (IBAction)btnBackDidClicked:(id)sender;
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) FBSDKLoginManager *login;
@property (strong, nonatomic) FBSDKAccessToken *loginToken;
@property (strong, nonatomic) NSString *user_id;
@property (strong, nonatomic)NSString *user_type;
@end
