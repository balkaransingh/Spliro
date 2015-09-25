//
//  SpTabBarControllerVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 21/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpTabBarControllerVC.h"

@interface SpTabBarControllerVC ()

@end

@implementation SpTabBarControllerVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad {
    @try
    {
    [super viewDidLoad];
    // set TintColor of tab bar icon 
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:247.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0]];
    
    //set the tab bar title appearance for normal state
    [[UITabBarItem appearance]
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor],
                              NSFontAttributeName:[UIFont boldSystemFontOfSize:10.0f]}
     forState:UIControlStateNormal];
    
    //set the tab bar title appearance for selected state
    [[UITabBarItem appearance]
     setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:247.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0],
                               NSFontAttributeName:[UIFont boldSystemFontOfSize:10.0f]}
     forState:UIControlStateSelected];
    }
    @catch(NSException *exception)
    {
    
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
