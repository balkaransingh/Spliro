//
//  SpBrowseCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpBrowseCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displayName;
@property (strong, nonatomic) IBOutlet TQStarRatingView *rateUser;
@property (strong, nonatomic) IBOutlet UILabel *lbl_recentPost;
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;
@property (strong, nonatomic) IBOutlet UIView *viewTimeLeft;
@property (strong, nonatomic) IBOutlet UIView *viewDistance;
@property (strong, nonatomic) IBOutlet UIView *ViewjoindedPeople;
@property (strong, nonatomic) IBOutlet UILabel *lbl_time;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UIButton *btnFavorites;
@property (strong, nonatomic) IBOutlet UILabel *lbl_joinedPeople;
- (IBAction)btnFavoritesDidClicked:(id)sender;

@end
