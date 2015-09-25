//
//  SpMyShareDetailsVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 21/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpMyShareDetailsVC.h"

@interface SpMyShareDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SpMyShareDetailsVC
@synthesize lbl_description,lbl_displayname,lbl_distance,lbl_eachPrice,lbl_joinedPeople,lbl_noOfShares,lbl_Share,lbl_shareEnd,lbl_shareEnds,lbl_title,lbl_totalPrice,userImage,ratingView,itemImage,title,mySharedetailScroll;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    itemImage = [SpliroFunctionViewController getImageBgLayer:itemImage];
    //userImage1 = [SpliroFunctionViewController getImageBgLayer:userImage1];
    userImage = [SpliroFunctionViewController getImageBgLayer:userImage];
    mySharedetailScroll.contentSize = CGSizeMake(320, 910);
    self.mysharedetailTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
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

- (IBAction)btnBackDidClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)btnDeclineDidClicked:(id)sender {
}

- (IBAction)btnCloseDidClicked:(id)sender {
}
#pragma  TableViewDelegates And DataSources

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myshareDetails";
    SpMyShareDetailsCell *cell = (SpMyShareDetailsCell *)[self.mysharedetailTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
//    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
//    
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:247.0/255.0f green:70.0/255.0f blue:86.0/255.0f alpha:1.0f]title:@"remove"];
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:129.0/255.0f green:206.0/255.0f blue:154.0/255.0f alpha:1.0f]title:@"accept"];
//    
    if (cell == nil)
    {
        cell = [[SpMyShareDetailsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    cell.rightUtilityButtons = rightUtilityButtons;
//    cell.delegate = self;
    return cell;
}

@end
