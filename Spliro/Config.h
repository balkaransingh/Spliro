//
//  Config.h
//  Spliro
//
//  Created by Vikram Singh Charan on 04/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APP_VERSION  @"vd00-01-01"
#define DEVICE_OS @"ios"
//#define SOURCE_APP @"iphone"
@interface Config : NSObject
+(NSString *)getOSVersion;
+(NSString *)getVersion;
+ (NSString*)macAddress;
+(NSString *)getScreenResolution;
+(NSString *)getDeviceID;
+(NSString *)getOSType;
+(NSString *)getDeviceModel;
+(NSString *)getCurrentAppClientVer;
+(NSString *)getSourceApp;
+(NSString *)osVersionBuild;

@end
