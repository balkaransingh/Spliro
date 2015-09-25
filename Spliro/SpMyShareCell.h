//
//  SpMyShareCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 25/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SWTableViewCell.h"
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpMyShareCell : SWTableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *displayName;
@property (strong, nonatomic) IBOutlet TQStarRatingView *ratingView;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *lbl_recentPost;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Title;
@property (strong, nonatomic) IBOutlet UIView *view_TimeLeft;
@property (strong, nonatomic) IBOutlet UIView *view_Distance;
@property (strong, nonatomic) IBOutlet UIView *view_joinedPeople;
@property (strong, nonatomic) IBOutlet UILabel *lbl_timeLeft;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_joinedPeople;
@property (strong, nonatomic) IBOutlet UIButton *btnfavorites;
@property (strong, nonatomic) IBOutlet UILabel *lbl_show;
- (IBAction)btnFavoritesDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_left;
@property (strong, nonatomic) IBOutlet UILabel *lbl_away;
@property (strong, nonatomic) IBOutlet UILabel *lbl_joinedpeople;
@end
