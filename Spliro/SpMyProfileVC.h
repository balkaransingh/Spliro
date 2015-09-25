//
//  SpMyProfileVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Api_key.h"
#import "Validate.h"
#import "AppDelegate.h"
#import "SpliroFunctionViewController.h"
#import "SpCategoriesVC.h"

@interface SpMyProfileVC : UIViewController<UIActionSheetDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,SpCategoriesDelegate>
{
    NSDictionary *infos;
    NSString *profile_pic_name;
    BOOL isSelect;
    NSString *imageSring;
    NSString *mobilnumber, *email;
    UIView *view_logout;
    UISwitch *switchChange;
    UIView *view_notification;
    UIView *viewREd,*viewRed,*viewR;
    UIView *view_retypePassword;
    UITextField *txt_retype;
    UILabel *lbl_retypePWD,*lbl_notification;
    UIButton * btnLogOut;
    IBOutlet UITextField *txt_firstName;
    IBOutlet UIButton *btnEdit;
    IBOutlet UITextField *txt_emilid;
    IBOutlet UITextField *txt_displayname;
    IBOutlet UITextView *txtView_AboutMe;
    IBOutlet UITextField *txt_Password;
    IBOutlet UIView *myprofileView;
    IBOutlet UITextField *txt_lastName;
    IBOutlet UIScrollView *myProfile_scrollView;
    IBOutlet UIButton *btnCamera;
    IBOutlet UIButton *btnCategory;
    IBOutlet UIImageView *user_image;
    IBOutlet UILabel *lbl_display_name;
    NSMutableArray *list,*list_categories;
    MBProgressHUD *HUD;
    UIActivityIndicatorView *activityInd;
}
@property (nonatomic, copy) NSMutableArray *list_category;
- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnEditDidClicked:(id)sender;
- (IBAction)btnCameraDidClicked:(id)sender;
- (IBAction)btnCategoriesDidClicked:(id)sender;



@end
