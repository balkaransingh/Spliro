//
//  AppDelegate.h
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpTabBarControllerVC.h"
#import "SpHomeVC.h"
#import "Constants.h"

@class SpHomeVC;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SpHomeVC *home;
@property (strong, nonatomic) UINavigationController *navigationController;
-(void)logout;
@end

