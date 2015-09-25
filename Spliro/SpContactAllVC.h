//
//  SpContactAllVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 21/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpContactAllVC : UIViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myContactTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchContact;

- (IBAction)btnBackDidClicked:(id)sender;
@end
