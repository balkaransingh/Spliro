//
//  SpForgotPasswordVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpForgotPasswordVC.h"

@interface SpForgotPasswordVC ()

@end

@implementation SpForgotPasswordVC
@synthesize txt_EmailID_phone_no,HUD;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBackDidClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSubmitDidClicked:(id)sender
{
    @try {
        
        if(!NSSTRING_HAS_DATA(txt_EmailID_phone_no.text))
        {
            [[[UIAlertView alloc] initWithTitle:nil message:@"please enter the email or phone no" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
        }
        else
        {
            if (NSSTRING_HAS_DATA(txt_EmailID_phone_no.text))
            {
                NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
                [nf setNumberStyle:NSNumberFormatterNoStyle];
                NSString * newString = [NSString stringWithFormat:@"%@",txt_EmailID_phone_no.text];
                NSNumber * number = [nf numberFromString:newString];
                if(number)
                {
                    if([Validate isValidMobileNumber:txt_EmailID_phone_no.text])
                    {
                        mobileNumber = txt_EmailID_phone_no.text;
                    }
                    else
                    {
                        [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct phone no." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                    }
                }
                else
                {
                    if([Validate isValidEmailId:txt_EmailID_phone_no.text])
                    {
                        email = txt_EmailID_phone_no.text;
                    }
                    else
                    {
                        [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct email id." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                    }
                }
            }
            HUD = [[MBProgressHUD alloc] init];
            [HUD show:YES];
            [self.view addSubview:HUD];
            
            if ([Reachability reachabilityForInternetConnection])
            {
                NSMutableDictionary *dic = [[[Api_key alloc] init]registrationKeys];
                [dic setValue:FORGOT_PASSWORD_SEND_OTP_USER forKey:@"cmd"];
                if ([mobileNumber isEqualToString:txt_EmailID_phone_no.text])
                {
                    [dic setValue:mobileNumber forKey:@"phone"];
                    [dic setValue:location_country_code forKey:@"location_country_code"];
                }
                else
                {
                    [dic setValue:email forKey:@"email"];
                }
                NSDictionary *d = [NSDictionary dictionaryWithDictionary:dic];
                NSError *error;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:d options:0 error:&error];
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
                     if (!connectionError)
                     {
                         [HUD hide:YES];
                         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                         if (NSSTRING_HAS_DATA([dict valueForKey:@"status"]))
                         {
                             if ([[dict valueForKey:@"status"] isEqualToString:STATUS_OK])
                             {
                                 [self performSegueWithIdentifier:@"segue_passwordSet" sender:nil];
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
                [[[UIAlertView alloc] initWithTitle:nil message:@"Netwotk not avaliable" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"segue_passwordSet"])
//    {
//        PasswordResetViewController *pass = (PasswordResetViewController *)segue.destinationViewController;
//        pass.otp_code =
//    }
//}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
        double var = 430-180-textField.frame.origin.y-textField.frame.size.height;
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
}@end
