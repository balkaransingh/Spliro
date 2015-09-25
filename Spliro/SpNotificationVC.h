//
//  SpNotificationVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpNotificationVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *notificationTable;

- (IBAction)btnSearchDidClicked:(id)sender;
- (IBAction)SegmentDidClicked:(id)sender;

@end
