//
//  SpMyShareVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpMyShareCell.h"
#import "SWTableViewCell.h"

@interface SpMyShareVC : UIViewController <SWTableViewCellDelegate>
- (IBAction)btnFavoriteDidClicked:(id)sender;
- (IBAction)btnCategoriesDidClicked:(id)sender;
- (IBAction)btnSearchDidClicked:(id)sender;
- (IBAction)segmentDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *View_DisplayUserName;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UITableView *myShareTableView;
@property (strong, nonatomic) IBOutlet UILabel *lbl_UserDisplayName;
@property (strong, nonatomic) IBOutlet UIImageView *userImage1;
@property (strong, nonatomic) IBOutlet TQStarRatingView *userRating;
@property (strong, nonatomic) IBOutlet UILabel *lbl_userDistance;
- (IBAction)btnFavoritesUserDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnCancelDidClicked;
- (IBAction)btnCancelDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_userInterest;
- (IBAction)btnDisplayUserNameDidClicked:(id)sender;

@end
