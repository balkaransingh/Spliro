//
//  SpliroFunctionViewController.h
//  Spliro
//
//  Created by Vikram Singh Charan on 20/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpliroFunctionViewController : UIViewController
+ (SpliroFunctionViewController *)sharedInstance;
+(void)showAlert:(NSString*)msg title:(NSString*)title;
+(UIView*)getViewBgLayer:(UIView*)viewBg;
+(UIImageView*)getImageBgLayer:(UIImageView*)imageBg;
+(UIButton*)getButtonBgLayer:(UIButton*)btnBg;
+(NSString*)getImageFormattedUrl:(NSString*)imageUrl;
+(UIView*)getViewBgLayerForMarkAsRead:(UIView*)viewBg;
+(UIButton *)getCancelButtonBgLayer:(UIButton *)btnbg;
@end
