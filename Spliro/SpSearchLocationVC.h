//
//  SpSearchLocationVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpSearchLocationVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *searchLocationTAbleView;
- (IBAction)btnApplyDidClicked:(id)sender;
- (IBAction)btnCancelDidClicked:(id)sender;
- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnAddLocationDidClicked:(id)sender;
@end
