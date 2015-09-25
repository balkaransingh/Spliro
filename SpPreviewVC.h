//
//  SpPreviewVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 20/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpPreviewVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displayName;
@property (strong, nonatomic) IBOutlet TQStarRatingView *viewRating;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Title;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_address;
@property (strong, nonatomic) IBOutlet UIButton *btnlocation;
@property (strong, nonatomic) IBOutlet UIView *viewDetails;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_TotalPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_eachPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_description;
@property (strong, nonatomic) IBOutlet UILabel *lbl_sharesEnds;
@property (strong, nonatomic) IBOutlet UILabel *lbl_noShares;
@property (strong, nonatomic) IBOutlet UILabel *lbl_noShare;
@property (strong, nonatomic) IBOutlet UILabel *lbl_timeLeft;
@property (strong, nonatomic) IBOutlet UIScrollView *previweScrollView;

- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnSaveDidClicked:(id)sender;
- (IBAction)btnDeleteDidClicked:(id)sender;
- (IBAction)btnPostDidClicked:(id)sender;
- (IBAction)btnViewReceiptDidClicked:(id)sender;
- (IBAction)btnGroupShareDidClicked:(id)sender;
- (IBAction)btnLocationDidClicked:(id)sender;
@end