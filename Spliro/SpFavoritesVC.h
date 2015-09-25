//
//  SpFavoritesVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpFavoritesCell.h"
#import "SpliroFunctionViewController.h"
#import "SpFavoritesUserCell.h"

@interface SpFavoritesVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *userTable;
}
- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnSearchdidClicked:(id)sender;
- (IBAction)SegmentDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *favoriteTableView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UITableView *userTable;
@end
