//
//  SpAddContactVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 22/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpAddContactVC.h"
#import "Validate.h"

@interface SpAddContactVC ()

@end

@implementation SpAddContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnBackDid:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnEnterDidClicked:(id)sender
{
    @try {
        if (![self.txt_email_phone_no.text isEqual :@""])
        {
            NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
            [nf setNumberStyle:NSNumberFormatterNoStyle];
            NSString * newString = [NSString stringWithFormat:@"%@",self.txt_email_phone_no.text];
            NSNumber * number = [nf numberFromString:newString];
            if(number)
            {
                if([Validate isValidMobileNumber:self.txt_email_phone_no.text])
                {
                    strMobile = self.txt_email_phone_no.text;
                    [self.delegate sentEmail_Phone_no:strMobile];
                    [self dismissViewControllerAnimated:YES completion:nil];
                    //[  self.btnEnter addTarget:self action:@selector(btnEnterDidClicked:) forControlEvents:UIControlEventTouchUpInside];
                    // [self.delegate sentEmail_Phone_no:self.txt_email_phone_no.text];
                }
                else
                {
                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct phone no." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                }
            }
            else
            {
                if([Validate isValidEmailId:self.txt_email_phone_no.text])
                {
                    streEmail = self.txt_email_phone_no.text;
                    [self.delegate sentEmail_Phone_no:streEmail];
                    [self dismissViewControllerAnimated:YES completion:nil];
                    // [  self.btnEnter addTarget:self action:@selector(btnEnterDidClicked:) forControlEvents:UIControlEventTouchUpInside];
                    //[self.delegate sentEmail_Phone_no:self.txt_email_phone_no.text];
                }
                else
                {
                    [[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter the correct email id." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                }
            }
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter the valid email id / phone no." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
        }
    }
    @catch (NSException *exception) {
        
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return  [textField resignFirstResponder];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
