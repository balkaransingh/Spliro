//
//  SpMyshareCurrentCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 25/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpMyshareCurrentCell.h"

@implementation SpMyshareCurrentCell
@synthesize viewuser,inviterDisplayName,inviterRatingView,invitersImage,chatArrowImage,chatAcceptImage,lbl_ChatAccept,btnChat;
- (void)awakeFromNib {
    // Initialization code
    lbl_ChatAccept.hidden = YES;
    chatAcceptImage.hidden =YES;
    UIImage *chatimage = [UIImage imageNamed:@"ic_check.jpg"];
    chatAcceptImage.image = [chatimage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [chatAcceptImage setTintColor:[UIColor blueColor]];
    chatArrowImage.hidden = YES;
    btnChat.hidden = YES;
    UIImage *image = [UIImage imageNamed:@"ic_arrow.png"];
    chatArrowImage.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [chatArrowImage setTintColor:[UIColor colorWithRed:247.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)btnChatDidClicked:(id)sender
{
    //[];
}

@end
