//
//  SpSearchVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpSearchVC.h"

@interface SpSearchVC ()

@end

@implementation SpSearchVC
@synthesize searchScrollview,searchTableView,sliderDistance,txt_range,lbl_distance,lbl_destinationDistance,lbl_initialDistance,lblDistance;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBackDidClicked:(id)sender {[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)btnCancelDidClicked:(id)sender {
}
- (IBAction)sliderDistanceChange:(id)sender {
}
- (IBAction)SegmentChangeValueDidClicked:(id)sender {
}
- (IBAction)btnApply:(id)sender {
}

#pragma UItableViewDelegaes and DataSources

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"searchCell";
    UITableViewCell *cell = [searchTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}
@end
