//  SpMoreVC.m
//  Spliro
//
//  Created by Vikram Singh Charan on 19/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpMoreVC.h"

@interface SpMoreVC ()

@end

@implementation SpMoreVC
@synthesize moreScrollView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    moreScrollView.contentSize =CGSizeMake(320, 500);
    //  share = [[SpShareVC alloc] initWithNibName:@"Share_with" bundle:nil];
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showCustomAlertInView:(UIView *)targetView{
    CGRect frame = CGRectMake(20, 160, 260, 160);
    [self.view setFrame:frame];
    [targetView addSubview:self.view];
}
-(void)feedbackMail
{
    @try {
        if ([MFMailComposeViewController canSendMail])
        {
            MFMailComposeViewController *VC = [MFMailComposeViewController new];
            [VC setSubject:@"FeedBack"];
            [VC setToRecipients:@[@"rajeshs@aryavratinfotech.com"]];
            VC.delegate =self;
            VC.mailComposeDelegate =self;
            [self presentViewController:VC animated:YES completion:nil];
        }

    }
    @catch (NSException *exception) {
        
    }
}
-(void)supportMail
{
    @try {
        if ([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *VC = [MFMailComposeViewController new];
            [VC setSubject:@"Support"];
            [VC setToRecipients:@[@"rajeshs@aryavratinfotech.com"]];
            VC.delegate =self;
            VC.mailComposeDelegate =self;
            [self presentViewController:VC animated:YES completion:nil];
        }
        
    }
    @catch (NSException *exception) {
        
    }
}
-(void)idea
{
    [self performSegueWithIdentifier:@"idea_segue" sender:nil];
}

- (IBAction)btnShareDidClicked:(id)sender
{
    @try {
        backView.backgroundColor = [UIColor colorWithRed:10/255.0f green:10/255.0f blue:10/255.0f alpha:0.5];
        [self.view addSubview:backView];
         backView .hidden =NO;
        //[share showCustomAlertInView:self.view];
        shareView =  [[UIView alloc ] initWithFrame:CGRectMake(30, 200, 260, 160)];
        shareView.backgroundColor = [UIColor whiteColor];
        
        
        UIView *title = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 40)];
        [title setBackgroundColor:[UIColor colorWithRed:242.0/255.0f green:44.0f/255.0f blue:69.0/255.0f alpha:1.0f]];
        
        //uiimage view create
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(69, 5, 30, 30)];
        UIImage *image = [UIImage imageNamed:@"ic_share1.png"];
        imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [imageView setTintColor:[UIColor whiteColor]];
        [title addSubview:imageView];
        [shareView addSubview:title];
        
        // UILable create
        UILabel *lbl_share = [[UILabel alloc] initWithFrame:CGRectMake(109, 5, 84, 30)];
        lbl_share.text = @"Share with";
        [lbl_share setTextColor:[UIColor whiteColor]];
        lbl_share.font = [UIFont fontWithName:@"helvetica neue" size:17];
        [shareView addSubview:lbl_share];
        
        
        //facebook button create
        UIButton *btnfacebook = [[UIButton alloc] initWithFrame:CGRectMake(17, 78, 40, 40)];
        [btnfacebook setImage:[UIImage imageNamed:@"sp_fb_ic.png"] forState:UIControlStateNormal];
        btnfacebook.tag =1;
        [btnfacebook addTarget:self action:@selector(btnFacebookDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [shareView addSubview:btnfacebook];
        
        // twitter button create
        UIButton *btnTwitter = [[UIButton alloc] initWithFrame:CGRectMake(78, 78, 40, 40)];
        [btnTwitter setImage:[UIImage imageNamed:@"sp_twitter_ic.png"] forState:UIControlStateNormal];
        btnTwitter.tag =2;
        [btnTwitter addTarget:self action:@selector(btnTwitterDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [shareView addSubview:btnTwitter];
        
        // google plus button create
        UIButton *btnGoogle = [[UIButton alloc] initWithFrame:CGRectMake(141, 78, 40, 40)];
        [btnGoogle setImage:[UIImage imageNamed:@"sp_google_ic.png"] forState:UIControlStateNormal];
        btnGoogle.tag =3;
        [btnGoogle addTarget:self action:@selector(btnGooglPlusDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [shareView addSubview:btnGoogle];
        
        // email button create
        UIButton *btnEmail = [[UIButton alloc] initWithFrame:CGRectMake(199, 78, 40, 40)];
        [btnEmail setImage:[UIImage imageNamed:@"sp_email_ic.png"] forState:UIControlStateNormal];
        btnEmail.tag =4;
        [btnEmail addTarget:self action:@selector(btnEmailDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [shareView addSubview:btnEmail];
        
        [self.view addSubview:shareView];

    }
    @catch (NSException *exception) {
       
    }
}

- (void)btnFacebookDidClicked:(id)sender
{
    @try {
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            NSString *url = @"http://54.174.74.84/public/tasks/v/cat-76-mobile+phones+%2526+computing/scat-580-android/test-from-your-own/NzE5NQ";
            NSURL *validUrl = [NSURL URLWithString:url]; ///[NSURL URLWithString:[_selectedProjD.project_detail_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [controller addURL:validUrl];
            [self presentViewController:controller animated:YES completion:Nil];
        }else{
            [[[UIAlertView alloc] initWithTitle:nil message:@"You must login by a valid facebook account from setting in your device." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
            
        }
        [shareView setHidden:YES];
        [backView setHidden:YES];
    }
    @catch (NSException *exception) {
        //  [EraErrorMessageClass writeErrorLog:className functionName:@"postToFacebook" exceptionDetails:exception.reason];
        NSLog( @"%@",exception);
    }
    
    
}
- (void)btnTwitterDidClicked:(id)sender
{
    @try {
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            NSString *url = @"http://54.174.74.84/public/tasks/v/cat-76-mobile+phones+%2526+computing/scat-580-android/test-from-your-own/NzE5NQ";
            NSURL *validUrl = [NSURL URLWithString:url]; ///[NSURL URLWithString:[_selectedProjD.project_detail_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [controller addURL:validUrl];
            [self presentViewController:controller animated:YES completion:Nil];
        }else{
            [[[UIAlertView alloc] initWithTitle:nil message:@"You must login by a valid twitter account from setting in your device." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
            
        }
        [shareView setHidden:YES];
        [backView setHidden:YES];
    }
    @catch (NSException *exception) {
        //  [EraErrorMessageClass writeErrorLog:className functionName:@"postToFacebook" exceptionDetails:exception.reason];
        NSLog( @"%@",exception);
    }
    
    
}
- (void)btnGooglPlusDidClicked:(id)sender
{
    NSLog(@"vc vikram");
    [shareView setHidden:YES];
    [backView setHidden:YES];
    
}
- (void)btnEmailDidClicked:(id)sender
{
    @try {
        if ([MFMailComposeViewController canSendMail]) {
            MFMailComposeViewController *VC = [MFMailComposeViewController new];
            [VC setSubject:@"Email"];
            [VC setToRecipients:@[@"rajeshs@aryavratinfotech.com"]];
            VC.delegate =self;
            VC.mailComposeDelegate =self;
            [self presentViewController:VC animated:YES completion:nil];
        }
    }
    @catch (NSException *exception) {
        
    }
}
- (IBAction)btnLocationDidClicked:(id)sender {
}

- (IBAction)btnInviteDidClicked:(id)sender
{
    [self performSegueWithIdentifier:@"segue_inviteAll" sender:nil];
}

- (IBAction)btnMyProfileDidClicked:(id)sender
{
    [self performSegueWithIdentifier:@"segue_MyProfile" sender:nil];
}
- (IBAction)btnRateDidClicked:(id)sender {
}

- (IBAction)btnIdeaDidClicked:(id)sender {
    [self performSegueWithIdentifier:@"idea_segue" sender:nil];
}

- (IBAction)btnFeedBackDidClicked:(id)sender {
    [self feedbackMail];
}

- (IBAction)btnSupportDidClicked:(id)sender {
    [self supportMail];
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    @try {
        [shareView setHidden:YES];
        [backView setHidden:YES];
        switch (result)
        {
            case MFMailComposeResultSent:
                [self mainSentMessageTitle:@"Success" msg:@"Sent" error:nil];
                break;
            case MFMailComposeResultCancelled:
                
                break;
            case MFMailComposeResultFailed:
                [self mainSentMessageTitle:@"Success" msg:nil error:[error description]];
            default:
                break;
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    @catch (NSException *exception) {
        
    }
}
-(void)mainSentMessageTitle:(NSString *)title msg:(NSString*)msg error:(NSString *)er
{
    [shareView setHidden:YES];
    [backView setHidden:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg?msg:er delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segue_inviteAll"])
    {
        invite_user = (SpInviteUserVC *)[segue destinationViewController];
        invite_user.isInviteMore =YES;
    }
}
@end
