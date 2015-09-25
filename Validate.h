//
//  Color+utill.h
//  Spliro
//
//  Created by Vikram Singh Charan on 03/08/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validate : NSObject
{
    NSString *email_id,*mobile_no;
}
+ (BOOL)isNull:(NSString*)str;
+ (BOOL)isValidEmailId:(NSString*)email;
+ (BOOL)isValidMobileNumber:(NSString*)number;
+ (BOOL) isValidUserName:(NSString*)userName;
+ (BOOL) isValidPassword:(NSString*)password;

@end
