//
//  SpLocationVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpLocationVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)btnBackDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_address;
- (IBAction)btn_NewAddressSave_DidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *locationTableView;
@property (strong, nonatomic) IBOutlet UIImageView *imageLocation;
@property (strong, nonatomic) IBOutlet UIImageView *locationImage;

@end
