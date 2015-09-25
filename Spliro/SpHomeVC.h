//
//  SpHomeVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SpHomeVC : UIViewController
{
 
}

@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UIView *view_home;
- (IBAction)btnNewUserDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageLogo;
- (IBAction)btnExistingUserDidClicked:(id)sender;

@end
