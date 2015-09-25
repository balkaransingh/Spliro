//
//  SpMyShareVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpMyShareVC.h"

@interface SpMyShareVC ()

{
    UIColor *red,*white;
}
@end

@implementation SpMyShareVC
@synthesize segmentControl,myShareTableView,userImage1,userRating,lbl_UserDisplayName,lbl_userDistance,lbl_userInterest,btnCancelDidClicked,View_DisplayUserName;
SpMyShareCell *cell;

 static NSString *cellIdentifier = @"mysharecell";
- (void)viewDidLoad
{
    @try
    {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        self.myShareTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        segmentControl.frame = CGRectMake(0, 0, 308, 40);
        segmentControl.layer.cornerRadius = 0;
        red =[UIColor colorWithRed:247.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0];
        white = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0  blue:245.0/255.0 alpha:1.0];
//        [[segmentControl.subviews objectAtIndex:1] setTintColor:red];
//        [[segmentControl.subviews objectAtIndex:0] setTintColor:red];
//        [[segmentControl.subviews objectAtIndex:2] setTintColor:red];
        self.segmentControl.selectedSegmentIndex = 1;
    
        [segmentControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f],NSForegroundColorAttributeName:[UIColor whiteColor]}
        forState:UIControlStateSelected];
        [segmentControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f], NSForegroundColorAttributeName:[UIColor whiteColor]}
        forState:UIControlStateNormal];
        cell =  [myShareTableView  dequeueReusableCellWithIdentifier:cellIdentifier];
        View_DisplayUserName.hidden = YES;
    }
    @catch(NSException *exception)
    {
    
    }
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

- (IBAction)btnFavoriteDidClicked:(id)sender {
}

- (IBAction)btnCategoriesDidClicked:(id)sender {
}

- (IBAction)btnSearchDidClicked:(id)sender {
}

- (IBAction)segmentDidClicked:(id)sender
{
    @try {
//        [segmentControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f],
//                                                 NSForegroundColorAttributeName:[UIColor whiteColor]}
//                                      forState:UIControlStateSelected];
        
        for (int i=0; i<[segmentControl.subviews count]; i++)
        {
            if ([[segmentControl.subviews objectAtIndex:i]isSelected] )
            {
               // [[segmentControl.subviews objectAtIndex:i] setTintColor: red];
            }else{
                [[segmentControl.subviews objectAtIndex:i] setBackgroundColor:[UIColor clearColor]];
            }
        }
        if(segmentControl.selectedSegmentIndex==0)
        {
            cell.lbl_show.text = @"you were invited";
            cell.lbl_show.hidden=NO;
            cell.view_TimeLeft.backgroundColor =red;
            cell.lbl_timeLeft.text = @"closed";
            cell.lbl_timeLeft.textColor = [UIColor whiteColor];
            cell.lbl_timeLeft.frame = CGRectMake(0, 12, 60, 35);
            cell.lbl_distance.textColor = [UIColor grayColor];
            cell.lbl_joinedPeople.textColor  = [UIColor grayColor];
            cell.lbl_joinedpeople.textColor = [UIColor grayColor];
            cell.view_joinedPeople.backgroundColor = [UIColor colorWithRed:245.0/255.0f green:245.0/255.0f blue:245.0/255.0f alpha:1.0f];
            cell.userImage.hidden = NO;
            cell.displayName.hidden = NO;
            cell.ratingView.hidden =NO;
            cell.lbl_left.hidden =YES;
    
            cell.btnfavorites.hidden=YES;
            cell.btnfavorites.userInteractionEnabled =NO;
            cell.lbl_joinedpeople.text = @"people joined";
            cell.lbl_joinedPeople.text =@"21";
            cell.lbl_joinedPeople.font = [UIFont systemFontOfSize:20];
            cell.lbl_recentPost.hidden = YES;
           
        }
        if (segmentControl.selectedSegmentIndex==1)
        {
            cell.lbl_show.hidden=YES;
            cell.view_TimeLeft.backgroundColor =[UIColor colorWithRed:245.0/255.0f green:245.0/255.0f blue:245.0/255.0f alpha:1.0f];
            // cell.lbl_timeLeft.text = @"closed";
            //  cell.lbl_timeLeft.textColor = [UIColor whiteColor];
            // cell.lbl_timeLeft.frame = CGRectMake(0, 12, 60, 35);
            //cell.lbl_distance.textColor = [UIColor grayColor];
            cell.lbl_joinedPeople.textColor  = [UIColor whiteColor];
            cell.lbl_joinedpeople.textColor = [UIColor whiteColor];
            cell.view_joinedPeople.backgroundColor = red;
            cell.userImage.hidden = NO;
            cell.displayName.hidden = NO;
            cell.ratingView.hidden =NO;
            cell.lbl_left.hidden =NO;
            cell.btnfavorites.hidden=NO;
            cell.lbl_timeLeft.text = @"24hr 59m";
            cell.lbl_timeLeft.textColor = [UIColor blackColor];
            cell.lbl_distance.textColor = [UIColor blackColor];
            cell.btnfavorites.userInteractionEnabled =YES;
            cell.lbl_joinedpeople.text = @"people joined";
            cell.lbl_joinedPeople.text =@"21";
            cell.lbl_joinedPeople.font = [UIFont systemFontOfSize:20];
            cell.lbl_recentPost.hidden = YES;
            
        }
        if(segmentControl.selectedSegmentIndex == 2)
        {
            cell.view_TimeLeft.backgroundColor =[UIColor colorWithRed:245.0/255.0f green:245.0/255.0f blue:245.0/255.0f alpha:1.0f];
            cell.userImage.hidden = YES;
            cell.displayName.hidden = YES;
            cell.lbl_show.hidden=NO;
            cell.lbl_left.hidden =NO;
            cell.lbl_timeLeft.text = @"24hr 59m";
            cell.lbl_left.textColor = [UIColor grayColor];
            cell.lbl_show.text = @"last saved 8:36 26 Aug";
            cell.lbl_timeLeft.textColor = [UIColor blackColor];
            cell.lbl_distance.textColor = [UIColor blackColor];
            cell.lbl_show.font = [UIFont systemFontOfSize:9];
            cell.ratingView.hidden =YES;
            cell.lbl_recentPost.hidden =YES;
            cell.btnfavorites.hidden=YES;
            cell.btnfavorites.userInteractionEnabled =NO;
            cell.lbl_joinedpeople.text = @"posted yet";
            cell.lbl_joinedPeople.text =@"not";
            cell.lbl_joinedPeople.textColor  = [UIColor whiteColor];
            cell.lbl_joinedpeople.textColor = [UIColor whiteColor];
            cell.lbl_joinedPeople.font = [UIFont systemFontOfSize:11];
            cell.view_joinedPeople.backgroundColor = red;
        }
       [myShareTableView reloadData];

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
    @try {
        static NSString *cellIdentifier = @"mysharecell";
        cell = [myShareTableView  dequeueReusableCellWithIdentifier:cellIdentifier];
        
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         red
                                                    title:@"remove"];
        if (cell == nil)
        {
            cell = [[SpMyShareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        
        
        cell.rightUtilityButtons = rightUtilityButtons;
        cell.delegate = self;
        
        
        return cell;

    }
    @catch (NSException *exception) {
        
    }
    
   }
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"segue_myshareDetails" sender:nil];
}

- (IBAction)btnFavoritesUserDidClicked:(id)sender {
}
- (IBAction)btnCancelDidClicked:(id)sender {
}
- (IBAction)btnDisplayUserNameDidClicked:(id)sender {
    View_DisplayUserName.hidden = NO;
    View_DisplayUserName.frame = CGRectMake(4, 18, 313, 290);
    userImage1 = [SpliroFunctionViewController getImageBgLayer:userImage1];
    btnCancelDidClicked.layer.cornerRadius = btnCancelDidClicked.frame.size.width/2 ;
    btnCancelDidClicked.layer.masksToBounds =YES;
    btnCancelDidClicked.layer.borderWidth =1;
    btnCancelDidClicked.layer.borderColor = [UIColor whiteColor].CGColor;
    [btnCancelDidClicked addTarget:self action:@selector(Cancel) forControlEvents:UIControlEventTouchUpInside];
}
-(void)Cancel
{
    View_DisplayUserName.hidden = YES;
}
@end
