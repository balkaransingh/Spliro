//
//  SpMyShareCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 25/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpMyShareCell.h"

@implementation SpMyShareCell
@synthesize userImage,view_Distance,view_joinedPeople,view_TimeLeft,itemImage,lbl_distance,lbl_joinedPeople,lbl_recentPost,lbl_timeLeft,lbl_Title,btnfavorites,lbl_show;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib
{
    // Initialization code
    userImage = [SpliroFunctionViewController getImageBgLayer:userImage];
    itemImage = [SpliroFunctionViewController getImageBgLayer:itemImage];
    view_TimeLeft = [SpliroFunctionViewController getViewBgLayer:view_TimeLeft];
    view_joinedPeople = [SpliroFunctionViewController getViewBgLayer:view_joinedPeople];
    view_Distance = [SpliroFunctionViewController getViewBgLayer:view_Distance];
    lbl_show.hidden=YES;
    lbl_recentPost.hidden =YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)btnFavoritesDidClicked:(id)sender
{
    [btnfavorites setImage:[UIImage imageNamed:@"spl_ic_favorites_e"] forState:UIControlStateNormal];
}

@end
