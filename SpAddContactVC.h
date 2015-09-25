//
//  SpAddContactVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 22/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SpAddContactVCDelegate <NSObject>
-(void)sentEmail_Phone_no :(NSString *)strEmail_phoneNo;
@end

@interface SpAddContactVC : UIViewController<UITextFieldDelegate>
{
    NSString *streEmail,*strMobile;
}
@property (strong, nonatomic) IBOutlet UIButton *btnEnter;
- (IBAction)btnBackDid:(id)sender;
@property (strong, nonatomic) id <SpAddContactVCDelegate>delegate;
@property (strong, nonatomic) IBOutlet UITextField *txt_email_phone_no;
- (IBAction)btnEnterDidClicked:(id)sender;

@end
