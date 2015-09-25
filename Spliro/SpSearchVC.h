//
//  SpSearchVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpSearchVC : UIViewController
- (IBAction)btnBackDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageLocation;
@property (strong, nonatomic) IBOutlet UILabel *lblDistance;
@property (strong, nonatomic) IBOutlet UITextField *txt_range;
- (IBAction)btnCancelDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewSlider;
@property (strong, nonatomic) IBOutlet UISlider *sliderDistance;
- (IBAction)sliderDistanceChange:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_initialDistance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_destinationDistance;
@property (strong, nonatomic) IBOutlet UILabel *lbl_distance;
- (IBAction)SegmentChangeValueDidClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewseprater;
@property (strong, nonatomic) IBOutlet UITableView *searchTableView;
- (IBAction)btnApply:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *searchScrollview;

@end
