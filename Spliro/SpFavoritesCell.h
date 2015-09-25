//
//  SpFavoritesCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 20/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpFavoritesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet TQStarRatingView *viewRating;
@property (strong, nonatomic) IBOutlet UILabel *DisplayName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Title;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UIView *view_TimeLeft;
@property (strong, nonatomic) IBOutlet UIView *view_Distance;
@property (strong, nonatomic) IBOutlet UIView *view_joined;
@property (strong, nonatomic) IBOutlet UILabel *lbl_timeLeft;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_joinedPeople;

- (IBAction)btnCancelDidClicked:(id)sender;
@end
