//
//  AppDelegate.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize navigationController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Assign tab bar item with titles
    //vikram singh 31/8/2015
//     UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    SpHomeVC *home = [mainStoryboard instantiateInitialViewController];
//    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:home];

   
    UIImageView *launchView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    launchView.image = [UIImage imageNamed:@"Default.png"];
    UIViewController *rootViewCtr = [[UIViewController alloc]init];
    rootViewCtr.view.frame = [UIScreen mainScreen].bounds;
    [rootViewCtr.view addSubview:launchView];
    self.window.rootViewController = rootViewCtr;
    [self performSelector:@selector(startSpliroApp:) withObject:nil afterDelay:2];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}
-(void)startSpliroApp:(id)sender{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"user_id"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SpTabBarControllerVC *dashboardVC = [storyboard instantiateViewControllerWithIdentifier:@"story_tabBar"];
//        [[UINavigationBar appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor clearColor],NSForegroundColorAttributeName, nil]];
//        navigationController = [[UINavigationController alloc] initWithRootViewController:dashboardVC];
//        navigationController.navigationBar.barTintColor = [UIColor clearColor];
//        navigationController.navigationBar.tintColor = [UIColor whiteColor];
//        NSShadow *shadow = [[NSShadow alloc] init];
//        shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
//        shadow.shadowOffset = CGSizeMake(0, 1);

        self.window.rootViewController = dashboardVC;
        [self.window makeKeyAndVisible];
       // self.window.rootViewController = dashboardVC;
       
    }else{
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SpHomeVC *loginCtr = [storyboard instantiateViewControllerWithIdentifier:@"firstViewcontroller"];
//        navigationController = [[UINavigationController alloc] initWithRootViewController:loginCtr];
//        [[UINavigationBar appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor clearColor],NSForegroundColorAttributeName, nil]];
//        navigationController = [[UINavigationController alloc] initWithRootViewController:loginCtr];
//        navigationController.navigationBar.barTintColor = [UIColor clearColor];
//        navigationController.navigationBar.tintColor = [UIColor whiteColor];
//        NSShadow *shadow = [[NSShadow alloc] init];
//        shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
//        shadow.shadowOffset = CGSizeMake(0, 1);
//        
//
        self.window.rootViewController = loginCtr;
        [self.window makeKeyAndVisible];
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];//vikram singh 31/8/2015
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
}
//vikram singh 31/8/2015
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if (url != nil)
    {
        
        return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    }
    return NO;
}

-(void)logout
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_ID];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_TYPE];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:PHONE];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:DISPLAY_NAME];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:FIRST_NAME];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:LAST_NAME];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:EMAIL];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:NOTIFY_PREF];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:PROFILE_PIC_URL];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ZIPCODE];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ADDRESS];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ABOUT_ME];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:REG_ID];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_CATEGORY];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SpHomeVC *loginCtr = [storyboard instantiateViewControllerWithIdentifier:@"firstViewcontroller"];
    self.window.rootViewController = loginCtr;
}
@end
