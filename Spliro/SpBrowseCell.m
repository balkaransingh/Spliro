//
//  SpBrowseCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpBrowseCell.h"

@implementation SpBrowseCell
@synthesize userImage,itemImage,viewDistance,ViewjoindedPeople,viewTimeLeft,lbl_recentPost,lbl_joinedPeople,lbl_distance,lbl_displayName,lbl_time,lbl_title,btnFavorites;
- (void)awakeFromNib
{
    // Initialization code
    userImage = [SpliroFunctionViewController getImageBgLayer:userImage];
    itemImage = [SpliroFunctionViewController getImageBgLayer:itemImage];
    viewTimeLeft = [SpliroFunctionViewController getViewBgLayer:viewTimeLeft];
    ViewjoindedPeople = [SpliroFunctionViewController getViewBgLayer:ViewjoindedPeople];
    viewDistance = [SpliroFunctionViewController getViewBgLayer:viewDistance];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnFavoritesDidClicked:(id)sender
{
    [btnFavorites setImage:[UIImage imageNamed:@"spl_ic_favorites_e"] forState:UIControlStateNormal];
}
@end
