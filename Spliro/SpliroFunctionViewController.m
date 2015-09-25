//
//  SpliroFunctionViewController.m
//  Spliro
//
//  Created by Vikram Singh Charan on 20/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "SpliroFunctionViewController.h"

@interface SpliroFunctionViewController ()
{
    int selectedLocaTypeSignUp;
    NSInteger systemTotalSeconds;
    NSTimer  *timer;
    NSDate *timeOnElapsed;
}
@end

@implementation SpliroFunctionViewController
static SpliroFunctionViewController *sharedInstance = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+ (SpliroFunctionViewController *)sharedInstance {
    
    if(!sharedInstance)
    {
        sharedInstance = [[SpliroFunctionViewController alloc] init];
    }
    return sharedInstance;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
+(void)showAlert:(NSString*)msg title:(NSString*)title{
    
    [[[UIAlertView alloc]initWithTitle:title
                               message:msg
                              delegate:self
                     cancelButtonTitle:@"Ok"
                     otherButtonTitles:nil]show];
}
+(UIView*)getViewBgLayerForMarkAsRead:(UIView*)viewBg
{
    
    //    viewBg.layer.shadowColor = [UIColor gray_line].CGColor;
    
    [viewBg setAlpha:1.0f];
    viewBg.layer.masksToBounds = NO;
    viewBg.layer.cornerRadius = 2.0f;
    viewBg.layer.shadowRadius = 2.0;
    viewBg.layer.shadowOffset = CGSizeMake(-0.2f, -0.2f);
    viewBg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    viewBg.layer.borderWidth = 0.1f;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:viewBg.bounds];
    viewBg.layer.shadowPath = path.CGPath;
    viewBg.layer.shadowOpacity = 0.2f;
    viewBg.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    viewBg.layer.opacity =  0.4;
    
    return viewBg;
    
}
+(UIView*)getViewBgLayer:(UIView*)viewBg{
    
    //    viewBg.layer.shadowColor = [UIColor gray_line].CGColor;
    
    [viewBg setAlpha:1.0f];
    viewBg.layer.masksToBounds = YES;
    viewBg.layer.cornerRadius = viewBg.frame.size.height/2;
    //viewBg.layer.borderWidth = 0.5f;
    return viewBg;
    
}
+(UIImageView*)getImageBgLayer:(UIImageView*)imageBg{
    
    imageBg.layer.cornerRadius = imageBg.frame.size.width / 2;
    imageBg.clipsToBounds = YES;
    imageBg.layer.borderColor = [UIColor whiteColor].CGColor;
    imageBg.layer.borderWidth = 0.8f;
    return imageBg;
    
}
+(UIButton*)getButtonBgLayer:(UIButton*)btnBg{
    
    btnBg.layer.cornerRadius = btnBg.frame.size.width/2;
    btnBg.clipsToBounds = YES;
    btnBg.layer.borderColor = [UIColor colorWithRed:247.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0].CGColor;
    btnBg.layer.borderWidth = 1.0f;
    return btnBg;
    
}
+(NSString*)getImageFormattedUrl:(NSString*)imageUrl{
    
    imageUrl = [imageUrl stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
    imageUrl = [imageUrl stringByReplacingOccurrencesOfString:@":/" withString:@"://"];
    imageUrl = [imageUrl stringByReplacingOccurrencesOfString:@"-" withString:@""];
    imageUrl = [imageUrl stringByReplacingOccurrencesOfString:@" " withString:@""];
    return imageUrl;
}
+(UIButton *)getCancelButtonBgLayer:(UIButton *)btnbg
{
    
    btnbg.layer.cornerRadius = btnbg.frame.size.width / 2;
    btnbg.clipsToBounds = YES;
    btnbg.layer.borderColor = [UIColor colorWithRed:247.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0].CGColor;
    btnbg.layer.borderWidth = 0.8f;
    return btnbg;
}
@end
