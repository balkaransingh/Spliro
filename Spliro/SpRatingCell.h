//
//  SpRatingCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpRatingCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageFriend;
@property (strong, nonatomic) IBOutlet UILabel *friendName;
@property (strong, nonatomic) IBOutlet TQStarRatingView *rateFriend;
@property (strong, nonatomic) IBOutlet TQStarRatingView *giveRatingToyourFriend;

@end
