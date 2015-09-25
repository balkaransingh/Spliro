//
//  SpFavoritesVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpFavoritesVC.h"

@interface SpFavoritesVC ()

@end

@implementation SpFavoritesVC
@synthesize favoriteTableView,segmentControl,userTable;
- (void)viewDidLoad
{
    @try {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        favoriteTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        self.segmentControl.selectedSegmentIndex = 0;
        
        [segmentControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f],NSForegroundColorAttributeName:[UIColor whiteColor]}
                                      forState:UIControlStateSelected];
        [segmentControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f], NSForegroundColorAttributeName:[UIColor whiteColor]}
                                      forState:UIControlStateNormal];
        userTable.hidden=YES;
        userTable.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    @catch (NSException *exception) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnBackDidClicked:(id)sender {[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSearchdidClicked:(id)sender
{
    
}

- (IBAction)SegmentDidClicked:(id)sender
{
    @try
    {
        for(int i=0;i<[segmentControl.subviews count];i++)
        {
            if ([[segmentControl.subviews objectAtIndex:i]isSelected] )
            {
                [[segmentControl.subviews objectAtIndex:i] setTintColor:[UIColor colorWithRed:247.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0]];
            }else{
                [[segmentControl.subviews objectAtIndex:i] setBackgroundColor:[UIColor clearColor]];
            }

        }
        if(segmentControl.selectedSegmentIndex == 0)
        {
            userTable.hidden =YES;
            favoriteTableView.hidden =NO;
            [favoriteTableView reloadData];
        }
        if(segmentControl.selectedSegmentIndex ==1)
        {
            userTable.hidden =NO;
            favoriteTableView.hidden = YES;
        }
    }
    @catch (NSException *exception) {
        
    }
    
}
#pragma  TableViewDelegates And DataSources

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
    @try
    {
        if(segmentControl.selectedSegmentIndex ==0)
        {
            static NSString *cellIdentifier = @"favoritsCell";
            SpFavoritesCell *cell = (SpFavoritesCell *)[favoriteTableView  dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil)
            {
                cell = [[SpFavoritesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            return cell;

        }
        if (segmentControl.selectedSegmentIndex==1)
        {
            static NSString*cellidentifier = @"userCell";
            SpFavoritesUserCell *cell = (SpFavoritesUserCell *)[userTable dequeueReusableCellWithIdentifier:cellidentifier];
            if (cell == nil)
            {
                cell = [[SpFavoritesUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
            }
            UIButton *cancel = (UIButton *)[cell.contentView viewWithTag:3];
            UIButton *remove = (UIButton *)[cell.contentView viewWithTag:4];
            
            cancel = [SpliroFunctionViewController getButtonBgLayer:cancel];
        [cancel addTarget:self action:@selector(CancelBtnDidClicked:)forControlEvents:UIControlEventTouchUpInside];
            remove.hidden=YES;
            remove.userInteractionEnabled = NO;
            return cell;
        }
    }
    @catch (NSException *exception) {
        
    }
}
-(void)CancelBtnDidClicked :(UIButton *)sender
{
    @try
    {
        CGPoint center= sender.center;
        CGPoint rootViewPoint = [sender.superview convertPoint:center toView:userTable];
        NSIndexPath *indexPath = [userTable indexPathForRowAtPoint:rootViewPoint];
        NSLog(@"%@",indexPath);
        SpFavoritesUserCell *ce  = (SpFavoritesUserCell *)[userTable dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
        
        ce.userdetailView.frame = CGRectMake(0, 0, 245, 60);
        UIButton *cancel = (UIButton *)[ce.contentView viewWithTag:3];
        cancel.hidden=YES;
        cancel.userInteractionEnabled =NO;
        UIButton *remove = (UIButton *)[ce.contentView viewWithTag:4];
        remove.hidden =NO;
        remove.userInteractionEnabled=YES;
        [remove addTarget:self action:@selector(tableView:commitEditingStyle:forRowAtIndexPath:) forControlEvents:UIControlEventTouchUpInside];
        [ce.contentView addSubview:remove];

    }
    @catch (NSException *exception)
    {
        
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
