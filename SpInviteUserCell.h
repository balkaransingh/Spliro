//
//  SpInviteUserCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 23/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpliroFunctionViewController.h"
#import "DeleteButton.h"

@interface SpInviteUserCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *user_Image;
@property (strong, nonatomic) IBOutlet UILabel *lbl_username;
@property (strong, nonatomic) IBOutlet UILabel *lbl_useremail_phone;
@property (strong, nonatomic) IBOutlet DeleteButton *btncancel;

@end
