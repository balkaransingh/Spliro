//
//  Config.m
//  Spliro
//
//  Created by Vikram Singh Charan on 04/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "Config.h"
#include <sys/sysctl.h>
#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <net/if_dl.h>
#include <ifaddrs.h>
#import "Config.h"
#import "UIDevice-Hardware.h"
#define IFT_ETHER 0x6

@implementation Config

+(NSString *)getDeviceID
{
    return [[[UIDevice currentDevice]identifierForVendor] UUIDString];
}
+(NSString *)osVersionBuild
{
    int mib[2] = {CTL_KERN, KERN_OSVERSION};
    u_int namelen = sizeof(mib) / sizeof(mib[0]);
    size_t bufferSize = 0;
    
    NSString *osBuildVersion = nil;
    
    // Get the size for the buffer
    sysctl(mib, namelen, NULL, &bufferSize, NULL, 0);
    
    u_char buildBuffer[bufferSize];
    int result = sysctl(mib, namelen, buildBuffer, &bufferSize, NULL, 0);
    
    if (result >= 0) {
        osBuildVersion = [[NSString alloc] initWithBytes:buildBuffer length:bufferSize encoding:NSUTF8StringEncoding];
    }
    
    return osBuildVersion;
}
+(NSString *)getScreenResolution
{
    int width = (int)roundf([UIScreen mainScreen].bounds.size.width);
    int height = (int)roundf([UIScreen mainScreen].bounds.size.height);
    NSString *resolution = [NSString stringWithFormat:@"%dx%d",width,height];
    return resolution;
}

+ (NSString*)macAddress
{
    return [[UIDevice currentDevice] macaddress];
}


+(NSString *)getVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+(NSString *)getCurrentAppClientVer
{
    return [NSString stringWithFormat:@"Version %@ (@)", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
}

+(NSString *)getOSType
{
    return DEVICE_OS;
}

+(NSString *)getOSVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+(NSString *)getDeviceModel
{
    return [[UIDevice currentDevice] platform];
}

+(NSString *)getSourceApp
{
    //SOURCE_APP = [[UIDevice currentDevice] model];
    return [[UIDevice currentDevice] model];
}

@end
