//
//  SpRatingFriendsVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpRatingFriendsVC : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnLaterDidClcked;
@property (strong, nonatomic) IBOutlet UIButton *btnSubmitDidCclicked;
@property (strong, nonatomic) IBOutlet UIScrollView *rateScrollView;
@property (strong, nonatomic) IBOutlet UIView *reteView;
@property (strong, nonatomic) IBOutlet UITableView *rateTableView;
@property (strong, nonatomic) IBOutlet UILabel *lbl_title_rate;

- (IBAction)btnBackDidClicked:(id)sender;
@end
