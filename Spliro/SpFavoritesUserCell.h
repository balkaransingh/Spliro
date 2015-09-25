//
//  SpFavoritesUserCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 27/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"

@interface SpFavoritesUserCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *userdetailView;
@property (strong, nonatomic) IBOutlet UILabel *userDisplayName;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;

- (IBAction)btnCancelDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet TQStarRatingView *userRating;

@end