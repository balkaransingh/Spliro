//
//  SpInviteUserCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 23/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpInviteUserCell.h"

@implementation SpInviteUserCell

- (void)awakeFromNib {
    // Initialization code
    self.user_Image = [SpliroFunctionViewController getImageBgLayer:self.user_Image];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
