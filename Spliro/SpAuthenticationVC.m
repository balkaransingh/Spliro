//
//  SpAuthenticationVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpAuthenticationVC.h"


@interface SpAuthenticationVC ()

@end

@implementation SpAuthenticationVC
@synthesize tabbarcontroller,message,HUD,txt_autheticatioCode,reg_id;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([textField isEqual:txt_autheticatioCode])
    {
        double var = 430-230-textField.frame.origin.y-textField.frame.size.height;
        CGRect rect = CGRectMake(0, var, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame= rect;
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect rect= CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame= rect;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
- (IBAction)btnResendPinDidClicked:(id)sender
{
    @try
    {
        if([Reachability reachabilityForInternetConnection])
        {
            HUD = [[MBProgressHUD alloc]initWithView:self.view];
            [self.view addSubview:HUD];
            [HUD show:YES];
            NSMutableDictionary *d = [[[Api_key alloc] init] registrationKeys];
            [d setValue:RESEND_CODE forKey:@"cmd"];
            [d setValue:reg_id forKey:@"reg_id"];
            [d setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"email"] forKey:@"email"];
            [d setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"phone"] forKey:@"phone"];
            NSLog(@"%@",d);
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
                     NSLog(@"Dictionary:%@",dict);
                     if (NSSTRING_HAS_DATA([dict valueForKey:@"status"]))
                     {
                         if ([[dict valueForKey:@"status"] isEqualToString:STATUS_OK])
                         {
                             [HUD hide:YES];
                             [[self txt_autheticatioCode] resignFirstResponder];
                             [self performSegueWithIdentifier:@"spliroBrowse" sender:nil];
                         }
                         //                         else
                         //                         {
                         //                             [[[UIAlertView alloc] initWithTitle:nil message:@"Authentication code is incorrect."delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                         //                         }
                     }
                 }
                 else
                 {
                     NSLog(@"Error :%@",connectionError);
                 }
             }];
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:nil message:@"Netwotk not avaliable" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
        }
    }
    @catch (NSException *exception)
    {
        
    }
}

- (IBAction)btnActivateAccountDidClicked:(id)sender
{
    @try {
        if(NSSTRING_HAS_DATA(txt_autheticatioCode.text))
        {
            if([Reachability reachabilityForInternetConnection])
            {
                HUD = [[MBProgressHUD alloc]initWithView:self.view];
                [self.view addSubview:HUD];
                [HUD show:YES];
                [self Authentication:reg_id ver_code:txt_autheticatioCode.text];
                
            }
            else
            {
                [[[UIAlertView alloc] initWithTitle:nil message:@"Netwotk not avaliable" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
            }
        }
        else
        {   [HUD hide:YES];
            [[[UIAlertView alloc] initWithTitle:nil message:@"please enter the authentication code."delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
        }

    }
    @catch (NSException *exception) {
        
    }
}
-(void)Authentication:(NSString *)reg_ids ver_code:(NSString *)verification_code
{
    @try {
        NSMutableDictionary *d = [[[Api_key alloc] init] registrationKeys];
        
        [d setValue:AUTHENTICATION forKey:@"cmd"];
        [d setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"reg_id"] forKey:@"reg_id"];
        [d setValue:verification_code forKey:@"verification_code"];
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
                 NSLog(@"Responsse :%@",dict);
                 if (NSSTRING_HAS_DATA([dict valueForKey:@"status"]))
                 {
                     if ([[dict valueForKey:@"status"] isEqualToString:STATUS_OK])
                     {
                         [HUD hide:YES];
                         NSDictionary *d = [dict valueForKey:@"data"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"display_name"] forKey:@"display_name"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"email"] forKey:@"email"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"first_name"] forKey:@"first_name"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"last_name"] forKey:@"last_name"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"notify_pref"] forKey:@"notify_pref"];
                         if([d valueForKey:@"phone"]==(id)[NSNull null])
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"phone"];
                         }
                         else
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"phone"] forKey:@"phone"];
                         }
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"profile_pic_url"] forKey:@"profile_pic_url"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"user_category"] forKey:@"user_category"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"user_id"] forKey:@"user_id"];
                         [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"user_type"] forKey:@"user_type"];
                         if ([d valueForKey:@"zipcode"]==(id)[NSNull null])
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:@"zipcode" forKey:@"zipcode"];
                         }
                         else
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"zipcode"] forKey:@"zipcode"];
                         }
                         if([d valueForKey:@"address"]==(id)[NSNull null])
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:@"address" forKey:@"address"];
                         }
                         else
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"address"] forKey:@"address"];
                         }
                         if([d valueForKey:@"about_me"]==(id)[NSNull null])
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:@"about_me" forKey:@"about_me"];
                         }
                         else
                         {
                             [[NSUserDefaults standardUserDefaults] setObject:[d valueForKey:@"about_me"] forKey:@"about_me"];
                         }
                         [self performSegueWithIdentifier:@"segue_browse" sender:nil];
                     }
                     else
                     {
                         [HUD hide:YES];
                         [[[UIAlertView alloc] initWithTitle:nil message:@"Authentication code is incorrect."delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                     }
                 }
             }
             else
             {
                 NSLog(@"Error :%@",connectionError);
             }
         }];
    }
    @catch (NSException *exception) {
        
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
- (IBAction)btnBackDidClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
