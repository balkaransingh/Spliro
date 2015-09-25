//
//  SpMyShareDetailsVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 21/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"
#import "SpMyShareDetailsCell.h"

@interface SpMyShareDetailsVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet TQStarRatingView *ratingView;
@property (strong, nonatomic) IBOutlet UILabel *lbl_totalPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_eachPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_joinedPeople;
@property (strong, nonatomic) IBOutlet UILabel *lbl_description;
@property (strong, nonatomic) IBOutlet UIView *viewDetail;
@property (strong, nonatomic) IBOutlet UILabel *lbl_noOfShares;
@property (strong, nonatomic) IBOutlet UILabel *lbl_shareEnds;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Share;
@property (strong, nonatomic) IBOutlet UILabel *lbl_shareEnd;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displayname;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UIScrollView *mySharedetailScroll;
- (IBAction)btnBackDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *mysharedetailTableView;
@property (strong, nonatomic) IBOutlet UIButton *btnCloseDidClicked;
- (IBAction)btnDeclineDidClicked:(id)sender;
- (IBAction)btnCloseDidClicked:(id)sender;
@end
