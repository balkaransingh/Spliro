//
//  PasswordResetViewController.m
//  Spliro
//
//  Created by Deepti on 03/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "PasswordResetViewController.h"

@interface PasswordResetViewController ()

@end

@implementation PasswordResetViewController
@synthesize OTP_TextField,EnterPassword_TextField,ReEnterPassword_TextField,HUD;
- (void)viewDidLoad {
    [super viewDidLoad];
    isSucess =NO;
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    double var = 430-230-textField.frame.origin.y-textField.frame.size.height;
    CGRect rect = CGRectMake(0, var, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame= rect;
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
- (IBAction)submit_Button:(UIButton *)sender
{
    @try {
        if(![OTP_TextField.text isEqual:@""])
        {
            if (![EnterPassword_TextField.text isEqual:@""])
            {
                if (![ReEnterPassword_TextField.text isEqual:@""])
                {
                    if ([Validate isValidPassword:EnterPassword_TextField.text] || [Validate isValidPassword:EnterPassword_TextField.text])
                    {
                        if ([ReEnterPassword_TextField.text isEqualToString:EnterPassword_TextField.text])
                        {
                            isSucess = YES;
                            [self apicall];
                        }
                        else
                        {
                            [[[UIAlertView alloc] initWithTitle:nil message:@"password mismatch" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
                        }
                    }
                    else
                    {
                        [[[UIAlertView alloc] initWithTitle:nil message:@"please enter atleast 8 alphnumeric character." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
                    }
                }
                else
                {
                    [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
                }
            }
            else
            {
                [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
                
            }
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter otp code" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
        }
    }
    @catch (NSException *exception) {
        
    }
   }
-(void)apicall
{
    @try {
        if (isSucess ==YES)
        {
            if ([Reachability reachabilityForInternetConnection])
            {
                HUD = [[MBProgressHUD alloc] init];
                [self.view addSubview:HUD];
                [HUD show:YES];
                
                NSMutableDictionary *d = [[[Api_key alloc]init]registrationKeys];
                [d setValue:FORGOT_PASSWORD_VERIFY_OTP_USER forKey:@"cmd"];
                [d setValue:OTP_TextField.text forKey:@"verification_code"];
                [d setValue:EnterPassword_TextField.text forKey:@"pwd"];
                
                NSDictionary *dic = [NSDictionary dictionaryWithDictionary:d];
                NSError *error;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
                NSString *jsonString;
                
                if (!jsonData)
                {
                    NSLog(@"%@", error);
                }
                else
                {
                    jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                }
                
                NSString *urlStr = [NSString stringWithFormat:@"%@?data=%@",Web_link,jsonString];
                urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                
                NSURL *url = [NSURL URLWithString:urlStr];
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
                                 [self performSegueWithIdentifier:@"unwindSege_login" sender:self];
                                 
                             }
                             else
                             {
                                 [HUD hide:YES];
                                 [[[UIAlertView alloc] initWithTitle:nil message:[dict valueForKey:@"msg"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                             }
                         }
                         else
                         {
                             [HUD hide:YES];
                             [[[UIAlertView alloc] initWithTitle:nil message:[dict valueForKey:@"msg"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                         }
                     }
                     else
                     {
                         [HUD hide:YES];
                         NSLog(@"%@",connectionError);
                     }
                 }];
            }
            else
            {
                [HUD hide:YES];
                [[[UIAlertView alloc] initWithTitle:nil message:@"Network not available." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[SpLogInVC class]])
    {
       // SpLogInVC *mainViewConroller = segue.destinationViewController;
        
    }
}
-(void)clear
{
    OTP_TextField.text = @"";
    EnterPassword_TextField.text =@"";
    ReEnterPassword_TextField.text=@"";
    [OTP_TextField resignFirstResponder];
    [EnterPassword_TextField resignFirstResponder];
    [ReEnterPassword_TextField resignFirstResponder];
}
@end
