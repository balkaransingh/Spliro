//
//  SpPriceVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 21/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpPriceVC : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txt_totalPrice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_pricePerShare;
- (IBAction)btnUploadReceiptDidClicked:(id)sender;

- (IBAction)btnBackDidClicked:(id)sender;
@end
