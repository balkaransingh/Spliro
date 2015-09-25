//
//  SpMyProfileVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpMyProfileVC.h"

@interface SpMyProfileVC ()

@end

@implementation SpMyProfileVC
@synthesize list_category;
- (void)viewDidLoad
{
    HUD = [[MBProgressHUD alloc]init];
    [self.view addSubview:HUD];
    [HUD show:YES];
    [super viewDidLoad];
    [self addViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBackDidClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnEditDidClicked:(id)sender
{
    @try {
        UIButton *resultebutton= (UIButton*)sender;
        
        NSString *buttontitle=resultebutton.currentTitle;
        if ([buttontitle isEqual:@"edit"])
        {
            isSelect=YES;
            [btnEdit setTitle:@"save" forState:UIControlStateNormal];
            [self userInterFaceEnable];
        }
        else
        {
            [self validate];
        }

    }
    @catch (NSException *exception) {
        
    }
}

-(void)addViews
{
    @try {
        
        myProfile_scrollView.contentSize = CGSizeMake(320, 655);
        user_image = [SpliroFunctionViewController getImageBgLayer:user_image];
        txt_firstName.text = [[NSUserDefaults standardUserDefaults]stringForKey:FIRST_NAME];
        txt_lastName.text = [[NSUserDefaults standardUserDefaults]stringForKey:LAST_NAME];
        txt_displayname.text = [[NSUserDefaults standardUserDefaults]stringForKey:DISPLAY_NAME];
        txt_emilid.text = [[NSUserDefaults standardUserDefaults]stringForKey:EMAIL];
        txtView_AboutMe.text = [[NSUserDefaults standardUserDefaults]stringForKey:ABOUT_ME];
        lbl_display_name.text = [[NSUserDefaults standardUserDefaults]stringForKey:DISPLAY_NAME];
        viewREd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 40)];
        [viewREd setBackgroundColor:[UIColor colorWithRed:242.0/255.0f green:44.0/255.0f blue:69.0/255.0f alpha:1.0]];
        viewR = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 40)];
        [viewR setBackgroundColor:[UIColor colorWithRed:242.0/255.0f green:44.0/255.0f blue:69.0/255.0f alpha:1.0]];
        viewRed = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 40)];
        [viewRed setBackgroundColor:[UIColor colorWithRed:242.0/255.0f green:44.0/255.0f blue:69.0/255.0f alpha:1.0]];
        list = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"user_category"]];
        lbl_notification = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, 129, 40)];
        lbl_notification.text = @"Notification";
        [lbl_notification setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
        [lbl_notification setTextColor:[UIColor darkGrayColor]];
        switchChange = [[UISwitch alloc] initWithFrame:CGRectMake(238, 5, 50, 30)];
        if ([[[NSUserDefaults standardUserDefaults]stringForKey:NOTIFY_PREF] isEqualToString:@"0"])
            [switchChange setOn:NO animated:YES];
        
        else
            [switchChange setOn:YES animated:YES];
        
        //[switchChange setOnTintColor:[UIColor blueColor]];
        switchChange.userInteractionEnabled =NO;
        view_notification = [[UIView alloc] initWithFrame:CGRectMake(8, 559, 304, 40)];
        [view_notification setBackgroundColor:[UIColor whiteColor]];
        [view_notification addSubview:viewREd];
        [view_notification addSubview:switchChange];
        [view_notification addSubview:lbl_notification];
        [myProfile_scrollView addSubview:view_notification];
        
        view_logout = [[UIView alloc] initWithFrame:CGRectMake(8, 607, 304, 40)];
        view_logout.backgroundColor = [UIColor whiteColor];
        btnLogOut = [[UIButton alloc] initWithFrame:CGRectMake(11, 0, 280, 40)];
        [btnLogOut setTitle:@"Log out" forState:UIControlStateNormal];
        [btnLogOut setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btnLogOut.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
        btnLogOut.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        btnLogOut.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btnLogOut addTarget:self action:@selector(btnLogoutDidClicked) forControlEvents:UIControlEventTouchUpInside];
        [view_logout addSubview:btnLogOut];
        [view_logout addSubview:viewRed];
        [myProfile_scrollView addSubview:view_logout];
        
        view_retypePassword = [[UIView alloc] initWithFrame:CGRectMake(8, 559, 304, 40)];
        [view_retypePassword setBackgroundColor:[UIColor whiteColor]];
        txt_retype = [[UITextField alloc] initWithFrame:CGRectMake(144, 0, 156, 40)];
        txt_retype.delegate =self;
        txt_retype.placeholder = @"***********";
        txt_retype.userInteractionEnabled = YES;
        txt_retype.textAlignment = NSTextAlignmentCenter;
        [txt_retype setSecureTextEntry:YES];
        lbl_retypePWD = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, 129, 40)];
        lbl_retypePWD.text = @"Retype password";
        [lbl_retypePWD setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
        [lbl_retypePWD setTextColor:[UIColor darkGrayColor]];
        [view_retypePassword addSubview:lbl_retypePWD];
        [view_retypePassword addSubview:txt_retype];
        [view_retypePassword addSubview:viewR];
        list_category = [[NSMutableArray alloc] init];
        NSString *strImageUrl = [[NSUserDefaults standardUserDefaults] stringForKey:@"profile_pic_url"];
        strImageUrl = [strImageUrl stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
        strImageUrl = [strImageUrl stringByReplacingOccurrencesOfString:@":/" withString:@"://"];
        strImageUrl = [strImageUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
        strImageUrl = [strImageUrl stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:strImageUrl]];
        [user_image setImage:[UIImage imageWithData:data]];
        
        if ( !user_image.image  )
        {
            //   [user_image setImage:[UIImage imageNamed:@"ic_user.png"]];
        }
        else
        {
            user_image.image = [UIImage imageWithData:data];
        }
        [HUD hide:YES];
    }
    @catch (NSException *exception) {
        
    }
}
-(void)userInterFaceEnable
{
    @try {
        if (isSelect==YES)
        {
            txt_firstName.userInteractionEnabled =YES;
            txt_lastName.userInteractionEnabled = YES;
            txt_Password.userInteractionEnabled = YES;
            txtView_AboutMe.userInteractionEnabled = YES;
            txt_displayname.userInteractionEnabled = YES;
            txt_emilid.userInteractionEnabled = YES;
            switchChange.userInteractionEnabled = YES;
            btnCamera.userInteractionEnabled = YES;
            btnCategory.userInteractionEnabled =YES;
            [txt_firstName becomeFirstResponder];
        }
        else
        {
            txt_firstName.userInteractionEnabled = NO;
            txt_lastName.userInteractionEnabled = NO;
            txt_Password.userInteractionEnabled = NO;
            txtView_AboutMe.userInteractionEnabled = NO;
            txt_displayname.userInteractionEnabled = NO;
            txt_emilid.userInteractionEnabled = NO;
            switchChange.userInteractionEnabled = NO;
            btnCamera.userInteractionEnabled = NO;
            btnCategory.userInteractionEnabled =NO;
        }
    }
    @catch (NSException *exception)
    {
        
    }
}
-(void)validate
{
    @try {
        if (![txt_firstName.text isEqual:@""])
        {
            if (![txt_lastName.text isEqual:@""])
            {
                if (![txt_displayname.text isEqual:@""])
                {
                    if (![txt_emilid.text isEqual:@""])
                    {
                        if (NSSTRING_HAS_DATA(txt_emilid.text))
                        {
                            NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
                            [nf setNumberStyle:NSNumberFormatterNoStyle];
                            NSString * newString = [NSString stringWithFormat:@"%@",txt_emilid.text];
                            NSNumber * number = [nf numberFromString:newString];
                            if(number)
                            {
                                if([Validate isValidMobileNumber:txt_emilid.text])
                                {
                                    mobilnumber = txt_emilid.text;
                                }
                                else
                                {
                                    [[[UIAlertView alloc]initWithTitle:nil message:@"Please enter the correct phone no." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                                }
                            }
                            else
                            {
                                if([Validate isValidEmailId:txt_emilid.text])
                                {
                                    email = txt_emilid.text;
                                }
                                else
                                {
                                    [[[UIAlertView alloc]initWithTitle:nil message:@"Please enter the correct email id." delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil] show];
                                }
                            }
                        }
                        [btnEdit setTitle:@"edit" forState:UIControlStateNormal];
                        isSelect =NO;
                        [self userInterFaceEnable];
                        [self update_myprofle_data];
                    }
                    else
                    {
                        [[[UIAlertView alloc]initWithTitle:nil message:@"Please enter email id/ phone no." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                    }
                }
                else
                {
                    [[[UIAlertView alloc]initWithTitle:nil message:@"Please enter display name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                }
            }
            else
            {
                [[[UIAlertView alloc]initWithTitle:nil message:@"Please enter last name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
        }
        else
        {
            [[[UIAlertView alloc]initWithTitle:nil message:@"Please enter first name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
    }
    @catch (NSException *exception) {
        
    }
}
-(void)update_myprofle_data
{
    @try {
        [HUD show:YES];
        view_notification.frame = CGRectMake(8, 559, 304, 40);  //[[UIView alloc] initWithFrame:CGRectMake(8, 419, 304, 40)];
        view_logout.frame = CGRectMake(8, 607, 304, 40);//[[UIView alloc] initWithFrame:CGRectMake(8, 467, 304, 40)];
        view_retypePassword.hidden = YES;
        myProfile_scrollView.contentSize = CGSizeMake(320, 655);
        NSMutableDictionary *dic = [[[Api_key alloc]init]registrationKeys];
        [dic setValue:UPDATE_MY_PROFILE forKey:@"cmd"];
        NSString * user_id =[[NSUserDefaults standardUserDefaults] stringForKey:USER_ID];
        NSNumber *d = [[NSNumber alloc] initWithInteger:[user_id intValue]];
        [dic setValue:d forKey:USER_ID];
        [dic setValue:txt_firstName.text forKey:FIRST_NAME];
        [dic setValue:txt_lastName.text forKey:LAST_NAME];
        [dic setValue:txt_displayname.text forKey:DISPLAY_NAME];
        [dic setValue:txt_emilid.text forKey:EMAIL];
        [dic setValue:profile_pic_name forKey:PROFILE_PIC_NAME];
        [dic setValue:txtView_AboutMe.text forKey:ABOUT_ME];
        [dic setValue:txt_Password.text forKey:PASSWORD];
        [dic setValue:@"" forKey:PHONE];
        [dic setValue:list_category forKey:@"user_category"];
        if ([switchChange isOn])
        {
            [dic setValue:@"1" forKey:NOTIFY_PREF];
        }
        else
        {
            [dic setValue:@"0" forKey:NOTIFY_PREF];
        }
        NSLog(@"%@",dic);
        
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
        
        urlSTR = [urlSTR stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:urlSTR];
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             if (!connectionError)
             {
                 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                 if (NSSTRING_HAS_DATA([dict valueForKey:@"status"]))
                 {
                     if ([[dict valueForKey:@"status"] isEqualToString:STATUS_OK])
                     {
                         NSLog(@"Responsse :%@",dict);
                         
                         NSDictionary *dic = [dict valueForKey:@"data"];
                         list_categories = [dic valueForKey:@"user_category"];
                         list = [list_categories valueForKey:@"category_id"];
                         [Api_key setUSerData:[dic valueForKey:@"first_name"] lastname:[dic valueForKey:@"last_name"] email:[dic valueForKey:@"email"] profile_pic:[dic valueForKey:@"profile_pic_url"]  usertype:[dic valueForKey:@"user_type"] displayName:[dic valueForKey:@"display_name"] userid:[dic valueForKey:@"user_id"]  zipcode:[dic valueForKey:@"zipcode"] address:[dic valueForKey:@"address"] aboutme:[dic valueForKey:@"about_me"]  usercatgory:list pwd:[dic valueForKey:@"pwd"]  notify:[dic valueForKey:@"notify_pref"] phone:[dic valueForKey:@"phone"]];
                         [HUD hide:YES];
                         
                     }
                     else
                     {
                         [HUD hide:YES];
                         [[[UIAlertView alloc] initWithTitle:nil message:[dict valueForKey:@"msg"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                     }
                 }
                 
             }
         }];
    }
    @catch (NSException *exception) {
    
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    //[myProfile_scrollView endEditing:YES];
    //[txt_firstName resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    @try {
        double var = 230-320-textField.frame.origin.y-textField.frame.size.height;
        CGRect rect = CGRectMake(0, var, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame= rect;
        
        if ([textField isEqual:txt_Password])
        {
            [myProfile_scrollView addSubview:view_retypePassword];
            view_notification.frame = CGRectMake(8, 607, 304, 40);  //[[UIView alloc] initWithFrame:CGRectMake(8, 419, 304, 40)];
            view_logout.frame = CGRectMake(8, 655, 304, 40);//[[UIView alloc] initWithFrame:CGRectMake(8, 467, 304, 40)];
            myProfile_scrollView.contentSize = CGSizeMake(320, 710);
        }
    }
    @catch (NSException *exception) {
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    @try {
        CGRect rect= CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame= rect;
        if ([textField isEqual:txt_Password])
        {
            [self password];
        }
        else if([textField isEqual:txt_retype])
        {
            [self password];
        }
    }
    @catch (NSException *exception) {
        
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)btnCameraDidClicked:(id)sender
{
    @try {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
            {
                if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
                {
                    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Upload Photo?" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Use Camera",@"Use Existing Photo", nil];
                    
                    [sheet setTag:1];
                    [sheet showInView:[UIApplication sharedApplication].keyWindow];
                    [self.view addSubview:sheet];
                    
                }
                else
                {
                    [[[UIAlertView alloc] initWithTitle:nil message:@"Front Camera doesn't exixts" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil]show];
                }
            }
            else
            {
                [[[UIAlertView alloc] initWithTitle:nil message:@"Photo Library doesn't exists" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil]show];
            }
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:nil message:@"Camera doesn't exixts" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil]show];
        }
    }
    @catch (NSException *exception) {
        
    }
}

-(void)actionSheet:(UIActionSheet *)sheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    @try {
        NSString *buttonTitleAtInde = [sheet buttonTitleAtIndex:buttonIndex];
        
        if ([buttonTitleAtInde isEqualToString:@"Use Camera"])
        {  [HUD show:YES];
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate =self;
            picker.allowsEditing =YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:nil];
            
        }
        else if ([buttonTitleAtInde isEqualToString:@"Use Existing Photo"])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate =self;
            picker.allowsEditing =YES;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:nil];
        }
    }
    @catch (NSException *exception) {
        
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    @try {
        UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
        NSData * imageData = UIImagePNGRepresentation(chosenImage);
        imageSring = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        user_image.image = chosenImage;
        if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:@"public.image"])
        {
            [NSURLConnection sendAsynchronousRequest:[Api_key setSingleFileMultipartRequestForUserID:[[NSUserDefaults standardUserDefaults] objectForKey:USER_ID] serverUrl:UPLOAD fileData:UIImagePNGRepresentation(info[UIImagePickerControllerEditedImage]) fileName:@"user_image.png" MIMEType:@"image/png"] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
             {
                 if (!connectionError)
                 {
                     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                     NSDictionary *d = [dict valueForKey:@"data"];
                     profile_pic_name = [d valueForKey:@"file_name"];
                     NSLog(@"%@",dict);
                     [HUD hide:YES];
                 }
             }];
        }
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }
    @catch (NSException *exception) {
        
    }
}

//#pragma mark - image cropped method
//-(UIImage *)cropImage:(UIImage*)cimage
//{
//    UIImage *image = [[UIImage alloc] init];
//    image = cimage;
//
//    // Create rectangle from middle of current image
//    CGRect croprect = CGRectMake(image.size.width / 4, image.size.height / 4 ,
//                                 (image.size.width / 2), (image.size.height / 2));
//
//    // Draw new image in current graphics context
//    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], croprect);
//
//    // Create new cropped UIImage
//    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
//
//    CGImageRelease(imageRef);
//    return croppedImage;
//}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//#pragma mark - Image_Compression
//- (NSData *)  compressImage:( UIImage *)  image{
//    @try {
//        float actualHeight = image.size.height;
//        float actualWidth = image.size.width;
//        float maxHeight = 600.0;
//        float maxWidth = 800.0;
//        float imgRatio = actualWidth/actualHeight;
//        float maxRatio = maxWidth/maxHeight;
//        float compressionQuality = 0.5;//50 percent compression
//
//        if  (actualHeight > maxHeight || actualWidth > maxWidth){
//            if (imgRatio < maxRatio ) {
//                //adjust width according to maxHeight
//                imgRatio = maxHeight / actualHeight;
//                actualWidth = imgRatio * actualWidth;
//                actualHeight = maxHeight;
//            }
//            else if (imgRatio > maxRatio)  {
//                //adjust height according to maxWidth
//                imgRatio = maxWidth / actualWidth;
//                actualHeight = imgRatio * actualHeight;
//                actualWidth = maxWidth;
//            }
//            else{
//                actualHeight = maxHeight;
//                actualWidth = maxWidth;
//            }
//        }
//
//        CGRect rect = CGRectMake( 0.0, 0.0, actualWidth, actualHeight)  ;
//        UIGraphicsBeginImageContext (rect.size ) ;
//        [image drawInRect:rect];
//        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//        NSData *imgData = UIImageJPEGRepresentation (img, compressionQuality ) ;
//        UIGraphicsEndImageContext();
//
//        return imgData;
//
//    }
//    @catch(  NSException *exception )
//    {
//
//    }
//}

- (void)password
{
    @try {
        if (![txt_Password.text isEqual:@""])
        {
            if(![txt_retype.text isEqual:@""])
            {
                if (![txt_retype.text isEqual:txt_Password.text])
                {
                    
                }
                else
                {
                    [[[UIAlertView alloc] initWithTitle:nil message:@"password mismatch" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
                }
            }
            else
            {
                [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter retype password." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
            }
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:nil message:@"Please enter password." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
        }
    }
    @catch (NSException *exception) {
        
    }
}

-(void)btnLogoutDidClicked
{
    AppDelegate *appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDele logout];
}

- (IBAction)btnCategoriesDidClicked:(id)sender
{
    [self performSegueWithIdentifier:@"segue_categories" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    @try {
        if ([segue.identifier isEqualToString:@"segue_categories"])
        {
            SpCategoriesVC *category = (SpCategoriesVC *)[segue destinationViewController];
            category.delegate = self;
            category.isselected = @"YES";
            category.save_cat_array = list;
        }
    }
    @catch (NSException *exception) {
        
    }
}
#pragma mark- Delegate method of spCategoriesVC

-(void)returnData :(NSMutableArray *)listData
{
    list_category = listData;
    
    NSLog(@"list category  :%@",list_category);
}
@end

