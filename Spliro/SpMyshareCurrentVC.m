//
//  SpMyshareCurrentVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 22/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpMyshareCurrentVC.h"


@interface SpMyshareCurrentVC ()

@end

@implementation SpMyshareCurrentVC
@synthesize lbl_title,lbl_joined,lbl_distance,lbl_description,lbl_eachPrice,lbl_leftShares,lbl_sharesEnds,lbl_totalPrice,lbl_totalShares,itemImage,myshareCurrentTableView,mysharecurrentScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mysharecurrentScrollView.contentSize = CGSizeMake(320, 850);
    myshareCurrentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    itemImage = [SpliroFunctionViewController getImageBgLayer:itemImage];
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

- (IBAction)btnClosedShareDidClicked:(id)sender {
}

- (IBAction)btnViewReceiptDidClicked:(id)sender {
}

- (IBAction)btnClosedDidClicked:(id)sender {
}

- (IBAction)btnBackDidClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnRepostDidClicked:(id)sender {
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20; // you can have your own choice, of course
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 20;
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}   
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try
    {
        static NSString *cellIdentifier = @"mysharecurrentcell";
        SpMyshareCurrentCell *cell = (SpMyshareCurrentCell *)[myshareCurrentTableView  dequeueReusableCellWithIdentifier:cellIdentifier];
        
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:129.0/255.0f green:206.0/255.0f blue:154.0/255.0f alpha:1.0f]title:@"accept"];
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:247.0/255.0f green:70.0/255.0f blue:86.0/255.0f alpha:1.0f]title:@"decline"];
        
        if (cell == nil)
        {
            cell = [[SpMyshareCurrentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.rightUtilityButtons = rightUtilityButtons;
        cell.delegate = self;
        return cell;
    }
    @catch(NSException *exception)
    {
    
    }
}

@end
