//
//  SpLocationCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpLocationCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lbl_address;
- (IBAction)btnCancelDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageLocationd;

@end
