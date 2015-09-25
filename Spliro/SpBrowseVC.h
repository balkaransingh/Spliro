//
//  SpBrowseVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpBrowseVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (IBAction)btnSearchDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageHeadershow;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
@property (strong, nonatomic) IBOutlet UITableView *mybrowseTableView;
@end
