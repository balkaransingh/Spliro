
//
//  SpRegistrationVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpRegistrationVC.h"

@interface SpRegistrationVC ()
{
    BOOL isSelect;
}
@end

@implementation SpRegistrationVC
@synthesize btnTermAndCondition,txt_EmailId_phone_no,txt_firstName,txt_LastName,txt_password,txt_retypePassword,login,loginToken,HUD,registrationScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any   additional setup after loading the view.
    isSelect = NO;
    isLogin =NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBackDidClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// BUTTON JOIN DID CLICKED

- (IBAction)btnJoinDidClicked:(id)sender
{
    @try
    {
        [self valide];
    }
    @catch(NSException *exception)
    {
        NSLog(@"%@",exception);
    }
}
// API CALLING FOR REGISTRATION USING FACEBOOK and SIMPLE
#pragma Api Calling Direct

-(void)RegisterTheUserWithName:(NSString *)paramFirstName lastName:(NSString *)paramLastName emailOrPhone:(NSString *)paramEmailOrPhone password:(NSString *)paramPassword
{
    @try
    {
        NSMutableDictionary *d = [[[Api_key alloc] init] registrationKeys];

        [d setValue:SIGNUP_USER forKey:@"cmd"];
    
        if (isLogin==YES)
        {
    
            [d setValue:@"F" forKey:@"reg_type"];
            [d setValue:paramFirstName forKey:@"first_name"];
            [d setValue:paramLastName forKey:@"last_name"];
            [d setValue:paramEmailOrPhone forKey:@"email"];
            [d setValue:facebook_user_id forKey:@"fb_user_id"];
            [d setValue:facebook_access_token forKey:@"fb_access_token"];
        }
        else
        {
            [d setValue:@"S" forKey:@"reg_type"];
            [d setValue:paramFirstName forKey:@"first_name"];
            [d setValue:paramLastName forKey:@"last_name"];
            if([mobileNumber isEqualToString:paramEmailOrPhone])
            {
                [d setValue:paramEmailOrPhone forKey:@"phone"];
                [d setValue:location_country_code forKey:@"location_country_code"];
            }
            else
                [d setValue:paramEmailOrPhone forKey:@"email"];
                [d setValue:paramPassword forKey:@"pwd"];
        }
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
                        [HUD hide:YES];
                        [self clear];
                        NSDictionary *dd = [dict valueForKey:@"data"];
                        [[NSUserDefaults standardUserDefaults] setObject:[dd valueForKey:@"reg_id"] forKey:@"reg_id"];
                        [self performSegueWithIdentifier:@"segue_authentication" sender:nil];
                    }
                    else
                    {
                        [HUD hide:YES];
                        [[[UIAlertView alloc] initWithTitle:nil message:[dict valueForKey:@"msg"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                    }
             }
                 [HUD hide:YES];
         }
         else
         {
              [HUD hide:YES];
             NSLog(@"Error :%@",connectionError);
         }
     }];
    }
    @catch(NSException *exception)
    {
        [HUD hide:YES];
        NSLog(@"%@",exception);
    }
}
-(void) valide
{
    @try
    {
        if (NSSTRING_HAS_DATA(txt_EmailId_phone_no.text))
        {
            NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
            [nf setNumberStyle:NSNumberFormatterNoStyle];
            NSString * newString = [NSString stringWithFormat:@"%@",txt_EmailId_phone_no.text];
            NSNumber * number = [nf numberFromString:newString];
            if(number)
            {
                if([Validate isValidMobileNumber:txt_EmailId_phone_no.text])
                {
                    mobileNumber = txt_EmailId_phone_no.text;
                }
                else
                {
                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct phone no." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                }
            }
            else
            {
                if([Validate isValidEmailId:txt_EmailId_phone_no.text])
                {
                    email = txt_EmailId_phone_no.text;
                }
                else
                {
                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct email id." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                }
            }
        }
        
        if(!isLogin)
        {
            if (![txt_firstName.text isEqual:@""])
            {
                if (![txt_LastName.text isEqual:@""])
                {
                    if (![txt_EmailId_phone_no.text isEqual:@""])
                    {
                        if ([Validate isValidEmailId:txt_EmailId_phone_no.text] || [Validate isValidMobileNumber:txt_EmailId_phone_no.text])
                        {
                            if (![txt_password.text isEqual:@""] )
                            {
                                if(![txt_retypePassword.text isEqual:@""])
                                {
                                
                                if ([Validate isValidPassword:txt_password.text] ||[Validate isValidPassword:txt_retypePassword.text])
                                {
                                    if ([txt_retypePassword.text isEqualToString:txt_password.text])
                                    {
                                        if (isSelect==YES)
                                        {
                                            HUD = [[MBProgressHUD alloc] init];
                                            [self.view addSubview:HUD];
                                            [HUD show:YES];
                                            [self RegisterTheUserWithName:txt_firstName.text lastName:txt_LastName.text emailOrPhone:txt_EmailId_phone_no.text password:txt_password.text];
                                        }
                                    }
                                    else
                                    {
                                        [[[UIAlertView alloc]initWithTitle:@"" message:@"Password mismatch." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                                    }
                                }
                                else
                                {
                                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter atleast 8 alphanumeric characters." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                                }
                                }
                                else
                                {
                                [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the retype password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                                }
                            }
                            else
                            {
                                [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                            }
                        }
                        else
                        {
                            [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter correct email id / phone no." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                        }
                    }
                    else
                    {
                        [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the email id." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                    }
                }
                else
                {
                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter last name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                }
            }
            else
            {
                [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter first name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
        }
        else
        {
            if(isSelect==YES)
            {
                if([Reachability reachabilityForInternetConnection])
                {
                    HUD = [[MBProgressHUD alloc] init];
                    [self.view addSubview:HUD];
                    [HUD show:YES];
                    [self RegisterTheUserWithName:txt_firstName.text lastName:txt_LastName.text emailOrPhone:txt_EmailId_phone_no.text password:txt_password.text];
                }
                else
                {
                    [[[UIAlertView alloc] initWithTitle:nil message:@"Network Not Responding" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                }
                
            }
            else
            {
                [[[UIAlertView alloc] initWithTitle:nil message:@"Please accept Term and Condition." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
            }
        }
    }
    @catch (NSException *exception)
    {
        
    }
}
-(void)clear
{
    @try
    {
        txt_password.text =@"";
        txt_EmailId_phone_no.text = @"";
        txt_firstName.text = @"";
        txt_LastName.text = @"";
        txt_retypePassword.text = @"";
        [txt_EmailId_phone_no resignFirstResponder];
        [txt_firstName resignFirstResponder];
        [txt_LastName resignFirstResponder];
        [txt_password resignFirstResponder];
        [txt_retypePassword resignFirstResponder];

    }
    @catch(NSException *exception)
    {
    
    }
}

// preparefor segue menthod is called for send data to authentication screen
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([segue.identifier isEqualToString:@"segue_authentication"])
//    {
//        SpAuthenticationVC *auth = (SpAuthenticationVC *)[segue destinationViewController];
//      //  auth.reg_id = reg_id;
//    }
//}
// button term and condition is select or not

- (IBAction)btnCheckDidClicked:(id)sender
{
    if(!isSelect)
    {
        [btnTermAndCondition setBackgroundImage:[UIImage imageNamed:@"ic_check.jpg"] forState:UIControlStateNormal];
        isSelect = YES;
    }
    else
    {
        [btnTermAndCondition setBackgroundImage:[UIImage imageNamed:@"ic_uncheck.jpg"] forState:UIControlStateNormal];
        isSelect= NO;
    }
}

// through facebook sdk login in user account
#pragma facebook sdk is called for login in user accounts

- (IBAction)btnFacebookDidClicked:(id)sender
{
    @try {
        if([FBSDKAccessToken currentAccessToken])
        {
           /// NSLog(@"%@",[FBSDKAccessToken currentAccessToken]);
            [FBSDKAccessToken setCurrentAccessToken:nil];
            [FBSDKProfile setCurrentProfile:nil];
            [login logOut];
            isLogin =NO;
        }
        else
        {
            HUD = [[MBProgressHUD alloc]initWithView:self.view];
            [self.view addSubview:HUD];
            [HUD show:YES];

            if(!isLogin)
            {
                login =[[FBSDKLoginManager alloc] init];
                login.loginBehavior = FBSDKLoginBehaviorBrowser;
                [login logInWithReadPermissions:@[@"public_profile",@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
                 {
                     if (error)
                     {[HUD hide:YES];

                         NSLog(@"Process error%@",error);
                     } else if (result.isCancelled) {[HUD hide:YES];

                         NSLog(@"Cancelled");
                     } else {
                         if([result.grantedPermissions containsObject:@"public_profile"] && [result.grantedPermissions containsObject:@"email"])
                         {
                             //NSLog(@"result is %@ ,%@",result,[[FBSDKAccessToken currentAccessToken] tokenString]);
                             ;
                             [self fetchUserInfo];
                             
                         }
                     }
                 }];
                isLogin = YES;
                [FBSDKAccessToken setCurrentAccessToken:nil];
                [FBSDKProfile setCurrentProfile:nil];
                [login logOut];
                [HUD hide:YES];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
   
   }
// fetch the user data from facebook account
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
                     txt_firstName.text = [dic objectForKey:@"first_name"];
                     txt_LastName.text = [dic objectForKey:@"last_name"];
                     txt_EmailId_phone_no.text = [dic objectForKey:@"email"];
                     facebook_user_id  = [dic objectForKey:@"id"];
                     facebook_access_token = [[FBSDKAccessToken currentAccessToken]tokenString];
                     
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
#pragma uitextfield delegate call
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
