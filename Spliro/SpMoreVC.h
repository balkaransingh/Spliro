//
//  SpMoreVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import "SpInviteUserVC.h"

@interface SpMoreVC : UIViewController<MFMailComposeViewControllerDelegate,UINavigationControllerDelegate>//jagdish
{
    SpInviteUserVC *invite_user;
    UIView *backView;
    UIView *shareView;
}
@property (strong, nonatomic) IBOutlet UIScrollView *moreScrollView;
@property (assign, nonatomic) BOOL isInviteMore;
- (IBAction)btnShareDidClicked:(id)sender;
- (IBAction)btnLocationDidClicked:(id)sender;
- (IBAction)btnInviteDidClicked:(id)sender;
- (IBAction)btnMyProfileDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnIdeaDidClicked;
- (IBAction)btnRateDidClicked:(id)sender;
- (IBAction)btnIdeaDidClicked:(id)sender;
- (IBAction)btnFeedBackDidClicked:(id)sender;
- (IBAction)btnSupportDidClicked:(id)sender;
@end
