//
//  SpInviteUserVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 21/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpInviteUserVC.h"

@interface SpInviteUserVC ()

@end

@implementation SpInviteUserVC
@synthesize inviteuserTableView,Array,sendData;
- (void)viewDidLoad
{
    @try
    {
        [super viewDidLoad];
        HUD = [[MBProgressHUD alloc]init];
        [self.view addSubview:HUD];
       // [HUD show:YES];

        isAddContact=NO;
        isSelected =NO;
        Array = [[NSMutableArray alloc] init];
        sendData =[[NSMutableArray alloc] init];
        if (self.isInviteMore == YES)
        {
            self.favoriteImage.hidden = YES;
            [self.btnSendData setTitle:@"send" forState:UIControlStateNormal];
            [self.inviteFrom_favoriteList setTitle:@"Invite by email/phone" forState:UIControlStateNormal];
        }
        else
        {
            [self.inviteFrom_favoriteList setTitle:@"invite through favorites list" forState:UIControlStateNormal];
        }
        inviteuserTableView.hidden =YES;
    }
    @catch (NSException *exception) {
        
    }
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    @try
    {
    if ([segue.identifier isEqualToString:@"segue_addContact"])
    {
        SpAddContactVC *addContact = (SpAddContactVC *)[segue destinationViewController];
        addContact.delegate =self;
    }
    }
    @catch(NSException *exception)
    {
        
    }
}


- (IBAction)btnInvitefromAddressbookDidClicked:(id)sender
{
    [self openIphoneContacts];
}

-(void)openIphoneContacts
{
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    picker.displayedProperties=@[@(kABPersonPhoneProperty)];
    [HUD show:YES];
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    @try {
        phone= nil;
        
        if (property == kABPersonPhoneProperty) {
            ABMultiValueRef contactphone = ABRecordCopyValue(person, kABPersonPhoneProperty);
            CFStringRef selectedNumber = ABMultiValueCopyValueAtIndex(contactphone, identifier);
            phone = (__bridge_transfer NSString*) selectedNumber;
            NSLog(@"phone :%@",phone);
            [self displayPerson:person];
        }
        else
        {
            return;
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    @catch (NSException *exception) {
    
    }
}

- (void)displayPerson:(ABRecordRef)person
{
    @try {
        NSMutableString *name =[NSMutableString new];
        
        NSString *firstName =  (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSString *lastName = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
        if (firstName != nil && lastName != nil) {
            [name appendString:firstName];
            [name appendString:[NSString stringWithFormat:@" %@",lastName]];
            
        }
        else if (firstName != nil) {
            [name appendString:firstName];
        }
        else if (lastName != nil) {
            [name appendString:lastName];
        }
        
        else
        {
            return;
        }
        
        NSLog(@"name :%@",name);
        
        UIImage *img ;
        if (person != nil && ABPersonHasImageData(person)) {
            if ( /* DISABLES CODE */ (&ABPersonCopyImageDataWithFormat) != nil ) {
                // iOS >= 4.1
                img= [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(person, kABPersonImageFormatThumbnail)];
            } else {
                // iOS < 4.1
                img= [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageData(person)];
            }
        } else {
            img= [UIImage imageNamed:@"ic_user"];
            isSelected = YES;
        }
        
        NSString *contactNum = phone;
        NSArray *words = [contactNum componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceCharacterSet]];
        contactNum= [words componentsJoinedByString:@""];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@"(" withString:@""];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@")" withString:@""];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@"+" withString:@""];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@"$" withString:@""];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@"!" withString:@""];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@"<" withString:@"("];
        contactNum=[contactNum stringByReplacingOccurrencesOfString:@">" withString:@")"];
        NSLog(@"name :%@",contactNum);
        // GET ONLY LAST 10 DIGITS FROM CONTACT NUMBER VIKRAM SINGH 25/9/2015
        contactNum = [contactNum substringFromIndex:[contactNum length]-10];
       
        if (contactNum.length<=13 && [[contactNum substringToIndex:1]isEqual:@"1"])
        {
            contactNum = [contactNum substringFromIndex:1];
        }
        if (contactNum.length!=10)
        {
            return;
            
        }
     //   NSString *code = [state substringFromIndex: [state length] - 2];
        
       
        
        NSMutableDictionary *   dict = [[NSMutableDictionary alloc] init];
        [dict setObject:contactNum forKey:POST_CONTACT_ID];
        [dict setObject:name forKey:@"user_name"];
        [dict setObject:img forKey:@"user_image"];
        [dict setObject:@"p" forKey:POST_CONTACT_TYPE];
        [Array addObject:dict];
     //   NSLog(@"%@",Array);
       
        inviteuserTableView.hidden = NO;
        [inviteuserTableView reloadData];
         [HUD hide:YES];
    }
    @catch (NSException *exception) {
       
    }
  }
- (IBAction)btnInvitefromFavoritlistDidClicked:(id)sender
{
    if (self.isInviteMore == YES)
    {
        [self performSegueWithIdentifier:@"segue_addContact" sender:nil];
    }
    else
    {
        [self performSegueWithIdentifier:@"segue_favorites" sender:nil];
    }
}


- (IBAction)btnBackDidClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnCancelDidClicked:(id)sender {
}

- (IBAction)btnSendDataDidClicked:(id)sender
{
    @try
    {   [HUD show:YES];
        if (Array.count!=0)
        {
            NSMutableDictionary *dic = [[[Api_key alloc] init] registrationKeys];
           
            [dic setObject:INVITE_ON_APP forKey:@"cmd"];
             NSLog(@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:USER_ID]);
            [dic setObject:[[NSUserDefaults standardUserDefaults] stringForKey:USER_ID] forKey:USER_ID];
            for(int i=0;i<Array.count;i++)
            {
                NSMutableDictionary *d =[[NSMutableDictionary alloc] init];
                [d setObject:[Array  valueForKey:POST_CONTACT_TYPE][i] forKey:POST_CONTACT_TYPE];
                [d setObject:[Array valueForKey:POST_CONTACT_ID][i] forKey:POST_CONTACT_ID];
                [sendData addObject:d];
            }
            NSLog(@"%@",sendData);
            [dic setObject:sendData forKey:@"invite"];
            NSDictionary *dict = [NSDictionary dictionaryWithDictionary:dic];
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
            NSLog(@"%@",urlSTR);
            urlSTR = [urlSTR stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSURL *url = [NSURL URLWithString:urlSTR];
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
             {
                 if(!connectionError)
                 {
                     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                     NSLog(@"dictionary :%@",dict);
                     if (NSSTRING_HAS_DATA([dict valueForKey:@"status"]))
                     {
                         if ([[dict valueForKey:@"status"] isEqualToString:STATUS_OK])
                         {
                             NSLog(@"Responsse :%@",dict);
                             [HUD hide:YES];
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
        else
        {
            [[[UIAlertView alloc] initWithTitle:@"spliro" message:@"Please invite users." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
        }
    }
    @catch (NSException *exception)
    {
      
    }
   
}
#pragma uitableViewDelegate and Datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try
    {
        static NSString *cellIdentifier = @"cellinviteuser";
        SpInviteUserCell *cell = (SpInviteUserCell *)[inviteuserTableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell==nil)
        {
            cell = [[SpInviteUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        inviteuserTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        cell.lbl_username.text = [[Array objectAtIndex:indexPath.row] valueForKey:@"user_name"];
        cell.lbl_useremail_phone.text = [[Array objectAtIndex:indexPath.row] valueForKey:POST_CONTACT_ID];
        cell.user_Image.image = [[Array objectAtIndex:indexPath.row] valueForKey:@"user_image"];
        btnDelete = (DeleteButton *)[cell.contentView viewWithTag:2];
        btnDelete.a = indexPath.row;
        [btnDelete addTarget:self action:@selector(delte:) forControlEvents:UIControlEventTouchUpInside];
        // NSLog(@"%lu",(unsigned long)btnDelete.a);
        //cell.btncancel.tag =indexPath.row;

        return cell;
    }
    @catch (NSException *exception)
    {
        
    }
    
}
-(void)delte :(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Spliro" message:@"Do you want to remove the invitee from list?" delegate:self cancelButtonTitle:@"no" otherButtonTitles:@"yes", nil];
//    UIButton *senderButton = (UIButton *)sender;
//    senderButton.tag = ;
//    [alert setTag:senderButton.tag];
    // it wasting my four day 
    CGPoint center= sender.center;
    CGPoint rootViewPoint = [sender.superview convertPoint:center toView:inviteuserTableView];
    NSIndexPath *indexPath = [inviteuserTableView indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"%ld",(long)indexPath.row);
    alert.tag = indexPath.row;
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        btnDelete.a = alertView.tag;
        [self btnDeleteMethodCall:btnDelete];
    }
}
-(void)btnDeleteMethodCall :(DeleteButton *)del
{
    NSLog(@"btndelete tag :%lu",(unsigned long)del.a);
    [Array removeObjectAtIndex:del.a];
    [inviteuserTableView reloadData];
}
-(void)sentEmail_Phone_no:(NSString *)strEmail_phoneNo
{
    @try
    {
        NSMutableDictionary *   dict = [[NSMutableDictionary alloc] init];
        if ([Validate isValidMobileNumber:strEmail_phoneNo])
        {
            [dict setObject:@"p" forKey:POST_CONTACT_TYPE];
        }
        if ([Validate isValidEmailId:strEmail_phoneNo])
        {
            [dict setObject:@"e" forKey:POST_CONTACT_TYPE];
        }
        [dict setObject:strEmail_phoneNo forKey:POST_CONTACT_ID];
        [dict setObject:@"unknown" forKey:@"user_name"];
        UIImage *image = [UIImage imageNamed:@"ic_user"];
        [dict setObject:image forKey:@"user_image"];
        [Array addObject:dict];
        inviteuserTableView.hidden = NO;
        [inviteuserTableView reloadData];
    }
    @catch (NSException *exception)
    {
        
    }
}

@end
