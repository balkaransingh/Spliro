//
//  SpSearchLocationCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpSearchLocationCell.h"

@implementation SpSearchLocationCell
@synthesize imageLocation;
- (void)awakeFromNib {
    // Initialization code
    UIImage *image = [UIImage imageNamed:@"ic_location.png"];
    imageLocation.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imageLocation setTintColor:[UIColor whiteColor]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
