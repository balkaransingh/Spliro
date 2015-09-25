//
//  SpRatingCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpRatingCell.h"

@implementation SpRatingCell

- (void)awakeFromNib {
    // Initialization code
    self.imageFriend = [SpliroFunctionViewController getImageBgLayer:self.imageFriend];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
