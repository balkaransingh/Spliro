//
//  Api_key.h
//  Spliro
//
//  Created by Vikram Singh Charan on 05/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "Config.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "Macros.h"
#import "Validate.h"
#import "SpliroFunctionViewController.h"
@interface Api_key : NSObject
{
    NSString *cmd;
    NSString *language_code;
    NSString *source_app;
    NSString *remote_device_id;
    NSString *device_mac_addr;
    NSString *emei_meid_esn;
    NSString *app_token;
    NSString *device_id;
    NSString *app_ver;
    NSString *device_model;
    NSString *device_density;
    NSString *device_resolution;
    NSString *os_type;
    NSString *os_ver;
    NSString *os_build_num;
    NSString *current_app_client_ver;
    NSString *first_name;
    NSString *last_name;
    NSString *email;
    NSString *pwd;
    NSString *reg_id;
    NSString *verification_code;
    NSString *reg_type;
    NSString *user_token;
    NSInteger *user_id;
    NSArray *user_category;
}
-(NSMutableDictionary *)registrationKeys;
+(NSMutableURLRequest *)setSingleFileMultipartRequestForUserID:(NSString *)userID serverUrl:(NSString *)url fileData:(NSData *)fileData fileName:(NSString *)fileName MIMEType:(NSString *)mimeType;
+(void)setUSerData :(NSString *)first_name lastname:(NSString *)last_name email:(NSString *)email profile_pic:(NSString *)profile_pic_url usertype:(NSString *)user_type displayName:(NSString *)display_name userid:(NSString *)user_id zipcode:(NSString *)zipcode address:(NSString *)address aboutme:(NSString *)about_me usercatgory :(NSMutableArray *)user_category pwd:(NSString *)pwd notify:(NSString *)notify_pref phone:(NSString *)phone_no;
@end
