//
//  SpMyShareDetailsCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 26/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpMyShareDetailsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *viewDetails;
@property (strong, nonatomic) IBOutlet UIImageView *inviteUserImage;
@property (strong, nonatomic) IBOutlet UILabel *inviteUserDisplayName;
@property (strong, nonatomic) IBOutlet TQStarRatingView *inviteUserRating;
@end
