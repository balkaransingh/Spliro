//
//  SpLogInVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpLogInVC.h"

@interface SpLogInVC ()
{
    BOOL isLogin;
}
@end

@implementation SpLogInVC
@synthesize login,loginToken,txt_password,txt_emilID_phone_no,HUD,user_type,user_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isLogin = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}
#pragma textfield delegate call

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
   
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([textField isEqual:self.txt_emilID_phone_no] ||[textField isEqual:self.txt_password])
    {
        double var = 450-450-textField.frame.origin.y-textField.frame.size.height;
        CGRect rect = CGRectMake(0, var, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame= rect;
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect rect= CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame= rect;
}


- (IBAction)btnForgotPasswordDidClicked:(id)sender
{
    [self performSegueWithIdentifier:@"segue_forgotPassword" sender:nil];
}
- (IBAction)btnLoginDidClicked:(id)sender
{
    @try
    {
        HUD = [[MBProgressHUD alloc]initWithView:self.view];
        [self.view addSubview:HUD];
        [HUD show:YES];
        
        if ([Reachability reachabilityForInternetConnection])
        {
            
             d = [[[Api_key alloc] init] registrationKeys];
            [d setValue:SIGNIN_USER forKey:@"cmd"];
            if (isLogin==YES)
            {
                [d setValue:@"f" forKey:@"login_type"];
                [d setValue:email_id forKey:@"email"];
                [d setValue:facebook_user_id forKey:@"fb_user_id"];
                isLogin =NO;
                [self apicall];
            }
            else
            {
                if (![txt_emilID_phone_no.text isEqual:@""])
                {
                    if (![txt_password.text isEqual:@""])
                    {
                        if ([Validate isValidPassword:txt_password.text])
                        {
                            NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
                            [nf setNumberStyle:NSNumberFormatterNoStyle];
                            NSString * newString = [NSString stringWithFormat:@"%@",txt_emilID_phone_no.text];
                            NSNumber * number = [nf numberFromString:newString];
                            if(number)
                            {
                                if([Validate isValidMobileNumber:txt_emilID_phone_no.text])
                                {
                                    mobileNumber = txt_emilID_phone_no.text;
                                }
                                else
                                {
                                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct phone no." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                                }
                            }
                            else
                            {
                                if([Validate isValidEmailId:txt_emilID_phone_no.text])
                                {
                                    email = txt_emilID_phone_no.text;
                                }
                                else
                                {
                                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct email id." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                                }
                            }
                            [d setValue:@"s" forKey:@"login_type"];
                            if([mobileNumber isEqualToString:txt_emilID_phone_no.text])
                            {
                                [d setValue:mobileNumber forKey:@"phone"];
                                [d setValue:location_country_code forKey:@"location_country_code"];
                            }
                            else
                                [d setValue:email forKey:@"email"];
                            [d setValue:txt_password.text forKey:@"pwd"];
                            [self apicall];
                        }
                        else
                        {
                            [[[UIAlertView alloc] initWithTitle:nil message:@"please enter atleast 8 alphnumeric character." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
                        }
                    }
                    else
                    {
                         [[[UIAlertView alloc]initWithTitle:@"" message:@"Enter Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                    }
                }
                else
                {
                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter email id/phone no" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                }
            }//[HUD hide:YES];
        }
        else
        {
            [HUD hide:YES];
            [[[UIAlertView alloc] initWithTitle:nil message:@"Netwotk not avaliable" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
}

-(void)apicall
{
    @try {
        NSDictionary *dict = [NSDictionary dictionaryWithDictionary:d];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
        NSString *jsonString;
        
        if(!jsonData)
        {
            NSLog(@"Got an error: %@",error);
        }
        else
        {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        NSString *urlSTR = [NSString stringWithFormat:@"%@?data=%@",Web_link,jsonString];
        
        urlSTR = [urlSTR stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:urlSTR];
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             if(!connectionError)
             {
                 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                 if (NSSTRING_HAS_DATA([dict valueForKey:@"status"]))
                 {
                     if ([[dict valueForKey:@"status"] isEqualToString:STATUS_OK])
                     {
                         NSLog(@"Responsse :%@",dict);
                         
                         NSDictionary *dic = [dict valueForKey:@"data"];
                         list_cagtegories = [dic valueForKey:@"user_category"];
                         list =  [list_cagtegories valueForKey:@"category_id"];
                         [Api_key setUSerData:[dic valueForKey:@"first_name"] lastname:[dic valueForKey:@"last_name"] email:[dic valueForKey:@"email"] profile_pic:[dic valueForKey:@"profile_pic_url"]  usertype:[dic valueForKey:@"user_type"] displayName:[dic valueForKey:@"display_name"] userid:[dic valueForKey:@"user_id"]  zipcode:[dic valueForKey:@"zipcode"] address:[dic valueForKey:@"address"] aboutme:[dic valueForKey:@"about_me"]  usercatgory:list pwd:[dic valueForKey:@"pwd"]  notify:[dic valueForKey:@"notify_pref"]  phone:[dic valueForKey:@"phone"]];
                         [HUD hide:YES];
                         [self performSegueWithIdentifier:@"segue_login_browser" sender:nil];
                     }
                     else
                     {
                         [HUD hide:YES];
                         [[[UIAlertView alloc] initWithTitle:nil message:[dict valueForKey:@"msg"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                     }
                 }
                 
             }
             else
             {
                 [HUD hide:YES];
                 NSLog(@"Error :%@",connectionError);
             }
         }];
    }
    @catch (NSException *exception) {
        
    }
}


#pragma  Button facebook did clicked
// facebook sdk user for login

- (IBAction)btnFacebookDidClicked:(id)sender
{
    @try
    {
        if ([Reachability reachabilityForInternetConnection])
        {
            HUD = [[MBProgressHUD alloc]initWithView:self.view];
            [self.view addSubview:HUD];
            [HUD show:YES];
            
            if([FBSDKAccessToken currentAccessToken])
            {
                NSLog(@"%@",[FBSDKAccessToken currentAccessToken]);
                [FBSDKAccessToken setCurrentAccessToken:nil];
                [FBSDKProfile setCurrentProfile:nil];
                [login logOut];
                isLogin =NO;
                HUD.hidden = YES;
            }
            else
            {
                if(!isLogin)
                {
                    login =[[FBSDKLoginManager alloc] init];
                    login.loginBehavior = FBSDKLoginBehaviorBrowser;
                    [login logInWithReadPermissions:@[@"public_profile",@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
                     {
                         if (error)
                         {
                             [HUD hide:YES];
                             NSLog(@"Process error%@",error);
                         }
                         else if (result.isCancelled)
                         {
                             [HUD hide:YES];
                             NSLog(@"Cancelled");
                         }
                         else
                         {
                             if([result.grantedPermissions containsObject:@"public_profile"] && [result.grantedPermissions containsObject:@"email"])
                             {
                                 [self fetchUserInfo];
                                 NSLog(@"result is %@ ,%@",result,[FBSDKAccessToken currentAccessToken]);
                                 ;
                                 
                             }
                         }
                     }];
                    
                    isLogin = YES;
                }
                [FBSDKAccessToken setCurrentAccessToken:nil];
                [FBSDKProfile setCurrentProfile:nil];
                [login logOut];
            }
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:nil message:@"Netwotk not avaliable" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
        }
    }
    @catch (NSException *exception)
    {
        NSLog(@"%@",exception);
    }
}
-(void)fetchUserInfo
{
    @try {
        if ([FBSDKAccessToken currentAccessToken])
        {
            NSLog(@"Token is available : %@",[[FBSDKAccessToken currentAccessToken]tokenString]);
            
            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, link, first_name, last_name, picture.type(large), email, birthday, bio ,location , friends ,hometown , friendlists"}]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (!error)
                 {
                     NSLog(@"resultis:%@",result);
                     NSDictionary *dic = [[NSDictionary alloc] init];
                     dic = result;
                     if(!NSSTRING_HAS_DATA([dic objectForKey:@"email"]))
                     {
                         
                     }
                     email_id = [dic objectForKey:@"email"];
                     facebook_user_id = [dic objectForKey:@"id"];
                     [HUD hide:YES];
                    [self btnLoginDidClicked:nil];
                 }
                 else
                 {
                     NSLog(@"Error %@",error);
                 }
             }];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
}
- (IBAction)btnBackDidClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)unwindFromModalViewController:(UIStoryboardSegue *)segue
{
    if ([segue.sourceViewController isKindOfClass:[PasswordResetViewController class]])
    {
    }
}

@end
