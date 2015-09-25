//
//  Api_key.m
//  Spliro
//
//  Created by Vikram Singh Charan on 05/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import "Api_key.h"
#import "UIDevice-Hardware.h"

@implementation Api_key
-(NSMutableDictionary *)registrationKeys
{
    @try {
        NSArray *arr =[NSArray arrayWithObjects:@"cmd",@"language_code",@"source_app",@"remote_device_id",@"device_mac_addr",@"emei_meid_esn",@"app_token",@"device_id",@"app_ver",@"device_model",@"device_density",@"device_resolution",@"os_type",@"os_build_num",@"os_ver",@"current_app_client_ver",@"reg_id", nil];
        
        NSArray *values = [[NSArray alloc] initWithObjects:@"",LANGUAGE_CODE,[Config getSourceApp], [Config macAddress], [Config macAddress],[Config getDeviceID],APP_TOKEN,[Config getDeviceID],[Config getVersion],[Config getDeviceModel], @"ppi",[Config getScreenResolution],[Config getOSType],[Config osVersionBuild],[Config getOSVersion],@"1", @"",nil];
        
        
        NSMutableDictionary *registerDict = [NSMutableDictionary dictionaryWithObjects:values forKeys:arr];
        return registerDict;
    }
    @catch (NSException *exception) {
        
    }
}
+(NSMutableURLRequest *)setSingleFileMultipartRequestForUserID:(NSString *)userID serverUrl:(NSString *)url fileData:(NSData *)fileData fileName:(NSString *)fileName MIMEType:(NSString *)mimeType
{
    @try {
        NSMutableURLRequest *serverRequest = nil;
        
        if(userID != nil || ![[NSString stringWithFormat:@"%@",userID] isEqualToString:@""] || url != nil || ![url isEqualToString:@""] || fileData.length >4)
        {
            NSURL *URL                         = [NSURL URLWithString:url];
            NSString * lineEnd = @"\r\n";
            NSString * twoHyphens = @"--";
            NSString * boundary = [[NSUUID UUID] UUIDString];
            NSData *voiceData = nil;
            voiceData = fileData;
            if(voiceData != nil)
            {
                serverRequest = [[NSMutableURLRequest alloc] init];
                [serverRequest setTimeoutInterval:60];
                [serverRequest setURL:URL];
                [serverRequest setHTTPMethod:@"POST"];
                [serverRequest addValue:[NSString stringWithFormat:@"%@",userID] forHTTPHeaderField:@"user_id"];
                [serverRequest addValue:mimeType forHTTPHeaderField:@"mime-Type"];
                [serverRequest addValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary] forHTTPHeaderField:@"Content-Type"];
                NSMutableData *bodyData = [[NSMutableData alloc] init];
                [bodyData appendData:[[NSString stringWithFormat:@"%@%@%@",twoHyphens, boundary,lineEnd] dataUsingEncoding:NSUTF8StringEncoding]];
                [bodyData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data;  name=\"uploaded_file\"; filename=%@ %@",[fileName stringByReplacingOccurrencesOfString:@" " withString:@"_"],lineEnd] dataUsingEncoding:NSUTF8StringEncoding]];
                [bodyData appendData:[[NSString stringWithFormat:@"%@", lineEnd] dataUsingEncoding:NSUTF8StringEncoding]];
                
                [bodyData appendData:voiceData];
                
                [bodyData appendData:[[NSString stringWithFormat:@"%@", lineEnd] dataUsingEncoding:NSUTF8StringEncoding]];
                [bodyData appendData:[[NSString stringWithFormat:@"%@%@%@%@",twoHyphens, boundary,twoHyphens, lineEnd] dataUsingEncoding:NSUTF8StringEncoding]];
                [serverRequest setHTTPBody:bodyData];
            }
        }
        return serverRequest;
    }
    @catch (NSException *exception) {
        
    }
}

+(void)setUSerData:(NSString *)first_name lastname:(NSString *)last_name email:(NSString *)email profile_pic:(NSString *)profile_pic_url usertype:(NSString *)user_type displayName:(NSString *)display_name userid:(NSString *)user_id zipcode:(NSString *)zipcode address:(NSString *)address aboutme:(NSString *)about_me usercatgory :(NSMutableArray *)user_category pwd:(NSString *)pwd notify:(NSString *)notify_pref phone:(NSString *)phone_no
{
    @try {
        [[NSUserDefaults standardUserDefaults] setObject:display_name forKey:@"display_name"];
        if(email == (id)[NSNull null])
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"email"];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"email"];
        }
        [[NSUserDefaults standardUserDefaults] setObject:first_name forKey:@"first_name"];
        [[NSUserDefaults standardUserDefaults] setObject:last_name forKey:@"last_name"];
        [[NSUserDefaults standardUserDefaults] setObject:notify_pref forKey:@"notify_pref"];
        if(phone_no == (id)[NSNull null])
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"phone"];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:phone_no forKey:@"phone"];
        }
        [[NSUserDefaults standardUserDefaults] setObject:profile_pic_url forKey:@"profile_pic_url"];
        [[NSUserDefaults standardUserDefaults] setObject:user_category forKey:@"user_category"];
        [[NSUserDefaults standardUserDefaults] setObject:user_id forKey:@"user_id"];
        [[NSUserDefaults standardUserDefaults] setObject:user_type forKey:@"user_type"];
        if (zipcode == (id)[NSNull null])
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"zipcode" forKey:@"zipcode"];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:zipcode forKey:@"zipcode"];
        }
        if(address == (id)[NSNull null])
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"address" forKey:@"address"];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:address forKey:@"address"];
        }
        if(about_me==(id)[NSNull null])
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"about_me" forKey:@"about_me"];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:about_me forKey:@"about_me"];
        }

    }
    @catch (NSException *exception) {
        
    }
}
@end
