//
//  SpFavoritesCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 20/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpFavoritesCell.h"

@implementation SpFavoritesCell
@synthesize lbl_distance,lbl_joinedPeople,lbl_Title,lbl_timeLeft,view_Distance,view_TimeLeft,view_joined,viewRating,userImage,itemImage;
- (void)awakeFromNib {
    // Initialization code
    userImage = [SpliroFunctionViewController getImageBgLayer:userImage];
    itemImage = [SpliroFunctionViewController getImageBgLayer:itemImage];
    view_TimeLeft = [SpliroFunctionViewController getViewBgLayer:view_TimeLeft];
    view_joined = [SpliroFunctionViewController getViewBgLayer:view_joined];
    view_Distance = [SpliroFunctionViewController getViewBgLayer:view_Distance];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnCancelDidClicked:(id)sender {
}
@end
