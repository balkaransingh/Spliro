//
//  SpFavoritesUserCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 27/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpFavoritesUserCell.h"

@implementation SpFavoritesUserCell
@synthesize userdetailView,userRating,userDisplayName,userImage,btnCancel;
- (void)awakeFromNib {
    // Initialization code
    userImage = [SpliroFunctionViewController getImageBgLayer:userImage];
    btnCancel = [SpliroFunctionViewController getButtonBgLayer:btnCancel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnCancelDidClicked:(id)sender
{
    userdetailView.frame = CGRectMake(0, 0, 245, 60);
    
}
@end
