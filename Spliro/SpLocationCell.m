//
//  SpLocationCell.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpLocationCell.h"

@implementation SpLocationCell
@synthesize imageLocationd,lbl_address;
- (void)awakeFromNib {
    // Initialization code
    UIImage *image = [UIImage imageNamed:@"ic_location.png"];
   imageLocationd.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imageLocationd setTintColor:[UIColor whiteColor]];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnCancelDidClicked:(id)sender {
}
@end
