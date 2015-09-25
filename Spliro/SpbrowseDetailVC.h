//
//  SpbrowseDetailVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpbrowseDetailVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displayName;
@property (strong, nonatomic) IBOutlet TQStarRatingView *viewRating;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Title;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_joinedPeople;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_TotalPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_eachPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_description;
@property (strong, nonatomic) IBOutlet UIImageView *invitedImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_invited;
@property (strong, nonatomic) IBOutlet UILabel *lbl_noShare;
@property (strong, nonatomic) IBOutlet UILabel *lbl_timeLeft;
@property (strong, nonatomic) IBOutlet UIScrollView *browseDetailScrollView;

- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnSendMessageDidClicked:(id)sender;
- (IBAction)btnDeclineDidClicked:(id)sender;
- (IBAction)btnViewReceiptDidClicked:(id)sender;
- (IBAction)btnAcceptDidClicked:(id)sender;
@end
