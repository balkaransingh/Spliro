//
//  SpInviteUserVC.h
//  Spliro
//
//  Created by Vikram Singh Charan on 21/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpAddContactVC.h"
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>
#import "Api_key.h"
#import "SpInviteUserCell.h"
#import "DeleteButton.h"

@interface SpInviteUserVC : UIViewController<UITableViewDataSource,UITableViewDelegate,SpAddContactVCDelegate,ABPeoplePickerNavigationControllerDelegate,UIAlertViewDelegate>
{
    UIImage *userImages;
    DeleteButton *btnDelete;
    NSString *phone;
    BOOL isSelected,isAddContact;
    MBProgressHUD *HUD;
}
@property (strong ,nonatomic)  NSMutableArray *Array,*sendData;
@property (strong, nonatomic) IBOutlet UIView *favoriteView;
@property (strong, nonatomic) IBOutlet UIButton *btnSendData;
@property (weak, nonatomic) NSString * userName, *userPhone, *userEmail;
@property (strong, nonatomic) IBOutlet UIButton *invite_from_Addressbook;
@property (strong, nonatomic) IBOutlet UIButton *inviteFrom_favoriteList;
@property (strong, nonatomic) IBOutlet UIImageView *addressbookImage;
@property (strong, nonatomic) IBOutlet UIImageView *favoriteImage;
@property (strong, nonatomic) IBOutlet UITableView *inviteuserTableView;
@property (assign, nonatomic) BOOL isInviteMore;

- (IBAction)btnInvitefromAddressbookDidClicked:(id)sender;
- (IBAction)btnInvitefromFavoritlistDidClicked:(id)sender;
- (IBAction)btnBackDidClicked:(id)sender;
- (IBAction)btnCancelDidClicked:(id)sender;
- (IBAction)btnSendDataDidClicked:(id)sender;
@end
