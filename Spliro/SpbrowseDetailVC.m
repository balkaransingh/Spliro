//
//  SpbrowseDetailVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpbrowseDetailVC.h"

@interface SpbrowseDetailVC ()

@end

@implementation SpbrowseDetailVC
@synthesize lbl_timeLeft,lbl_Title,lbl_joinedPeople,lbl_distance,lbl_displayName,lbl_description,lbl_eachPrice,lbl_invited,lbl_noShare,lbl_TotalPrice,userImage,itemImage,viewRating,invitedImage,browseDetailScrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    userImage = [SpliroFunctionViewController getImageBgLayer:userImage];
    itemImage = [SpliroFunctionViewController getImageBgLayer:itemImage];
    browseDetailScrollView.contentSize = CGSizeMake(320, 600);
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

- (IBAction)btnBackDidClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSendMessageDidClicked:(id)sender {
}

- (IBAction)btnDeclineDidClicked:(id)sender {
}

- (IBAction)btnViewReceiptDidClicked:(id)sender {
}

- (IBAction)btnAcceptDidClicked:(id)sender {
}
@end
