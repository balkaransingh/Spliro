//
//  SpCreatePostVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpCreatePostVC.h"

@interface SpCreatePostVC ()

@end

@implementation SpCreatePostVC
@synthesize createPostScrollView,txt_hashTag,txt_title,lbl_noIncease,lbl_number,lbl_shareEnd,lblAddress;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    createPostScrollView.contentSize = CGSizeMake(320, 560);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPreviewDidClicked:(id)sender
{
    [self performSegueWithIdentifier:@"segue_preview" sender:nil];
}
- (IBAction)btnCL_inforDidClicked:(id)sender {
}
- (IBAction)btnTitle_InforDidClicked:(id)sender {
}
- (IBAction)btnChangeLocationDidClicked:(id)sender {
}
- (IBAction)btnHashTagDidClicked:(id)sender {
}

- (IBAction)btnDescriptionDidClicked:(id)sender {
}

- (IBAction)btnShareEnd_infor:(id)sender {
}

- (IBAction)btn_info_uploadPhoto:(id)sender {
}

- (IBAction)btnUploadPhotoDidClicked:(id)sender {
}

- (IBAction)btn_info_ShareNoDidClicked:(id)sender {
}

- (IBAction)btnPlusDidClicked:(id)sender {
}

- (IBAction)btnMinusDidClicked:(id)sender {
}

- (IBAction)btn_infoInvitedDidClicked:(id)sender {
}

- (IBAction)btnInviteAllDidClicked:(id)sender
{
    [self performSegueWithIdentifier:@"segue_inviteall" sender:nil];
}

- (IBAction)btnPriceDidClicked:(id)sender
{
    [self performSegueWithIdentifier:@"segue_price" sender:nil];
}

- (IBAction)btn_infoPriceDidClicked:(id)sender {
}
@end
