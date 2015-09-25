//
//  SpMyshareCurrentVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 22/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpliroFunctionViewController.h"
#import "SpMyshareCurrentCell.h"
#import "SWTableViewCell.h"

@interface SpMyshareCurrentVC : UIViewController<SWTableViewCellDelegate>
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UIScrollView *mysharecurrentScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_totalPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_eachPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_joined;
@property (strong, nonatomic) IBOutlet UILabel *lbl_description;
@property (strong, nonatomic) IBOutlet UILabel *lbl_totalShares;
@property (strong, nonatomic) IBOutlet UILabel *lbl_leftShares;
@property (strong, nonatomic) IBOutlet UILabel *lbl_sharesEnds;
@property (strong, nonatomic) IBOutlet UITableView *myshareCurrentTableView;

- (IBAction)btnClosedShareDidClicked:(id)sender;
- (IBAction)btnViewReceiptDidClicked:(id)sender;
- (IBAction)btnClosedDidClicked:(id)sender;
- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnRepostDidClicked:(id)sender;
@end
