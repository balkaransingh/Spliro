//
//  SpCreatePostVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpCreatePostVC : UIViewController
- (IBAction)btnPreviewDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *createPostScrollView;
- (IBAction)btnTitle_InforDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_title;
- (IBAction)btnCL_inforDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblAddress;
- (IBAction)btnChangeLocationDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_hashTag;
- (IBAction)btnHashTagDidClicked:(id)sender;
- (IBAction)btnDescriptionDidClicked:(id)sender;
- (IBAction)btnShareEnd_infor:(id)sender;
- (IBAction)btn_info_uploadPhoto:(id)sender;
- (IBAction)btnUploadPhotoDidClicked:(id)sender;
- (IBAction)btn_info_ShareNoDidClicked:(id)sender;
- (IBAction)btnPlusDidClicked:(id)sender;
- (IBAction)btnMinusDidClicked:(id)sender;
- (IBAction)btn_infoInvitedDidClicked:(id)sender;
- (IBAction)btnInviteAllDidClicked:(id)sender;
- (IBAction)btnPriceDidClicked:(id)sender;
- (IBAction)btn_infoPriceDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_shareEnd;
@property (strong, nonatomic) IBOutlet UILabel *lbl_number;
@property (strong, nonatomic) IBOutlet UILabel *lbl_noIncease;

@end
