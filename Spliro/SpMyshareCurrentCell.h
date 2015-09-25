//
//  SpMyshareCurrentCell.h
//  Spliro
//
//  Created by Vikram Singh Charan on 25/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SWTableViewCell.h"
#import "TQStarRatingView.h"
#import "SpliroFunctionViewController.h"
@interface SpMyshareCurrentCell : SWTableViewCell
@property (strong, nonatomic) IBOutlet UIView *viewuser;
@property (strong, nonatomic) IBOutlet UIImageView *invitersImage;

@property (strong, nonatomic) IBOutlet UILabel *inviterDisplayName;
@property (strong, nonatomic) IBOutlet TQStarRatingView *inviterRatingView;
@property (strong, nonatomic) IBOutlet UIImageView *chatArrowImage;
@property (strong, nonatomic) IBOutlet UIButton *btnChat;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ChatAccept;
@property (strong, nonatomic) IBOutlet UIImageView *chatAcceptImage;

- (IBAction)btnChatDidClicked:(id)sender;
@end
