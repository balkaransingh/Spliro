//
//  Constants.h
//  Spliro
//
//  Created by Vikram Singh Charan on 04/09/15.
//  Copyright (c) 2015 com.aryavrat. All rights reserved.
//

#ifndef Spliro_Constants_h
#define Spliro_Constants_h
//Condition
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds].size.height >= 568)
#define IS_IPHONE_6 ([[UIScreen mainScreen] bounds].size.height >= 667.0)
#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define APP_TOKEN @"MARISASyADYpDFuGdDJxndBiquw8PsvU4NoWdv4xQ"
//#define GPLACE_API_TOKEN @"AIzaSyCbYuP5mkPeW5RgQGkDshCspbsgS4Fezhk"
#define Web_link @"http://182.237.17.106:8080/spliro/sitedev/api/web/v2/index/index"
#define UPLOAD @"http://182.237.17.106:8080/spliro/sitedev/api/web/v2/index/upload"
// Api Keys
#define CMD @"cmd"
#define REG_ID @"reg_id"
#define USER_DEVICE_ID @"user_device_id"
#define USER_TOKEN @"user_token"
#define LANGUAGE_CODE @"en_us"
#define DEVICE_MAC_ADDR @"device_mac_addr"
#define SOURCE_APP @"source_app"
#define REMOTE_DEVICE_ID @"remote_device_id"
#define EMEI_MEID_ESN @"emei_meid_esn"
#define DEVICE_ID @"device_id"
#define APP_VER @"app_ver"
#define DEVICE_MODEL @"device_model"
#define DEVICE_DENSITY @"device_density"
#define DEVICE_RESOLUTION @"device_resolution"
#define OS_VER @"os_ver"
#define OS_TYPE @"os_type"
#define OS_BUILD_NUM @"os_build_num"
#define CURRENT_APP_CLIENT_VER @"current_app_client_ver"
#define REG_TYPE_F @"F"
#define REG_TYPE_S @"S"
#define FACEBOOK_USER_ID @"fb_user_id"
#define FACEBOOK_ACCESS_TOKEN @"fb_access_token"
#define FACEBOOK_EXPIRES @"fb_expires"
#define FACEBOOK_LAST_UPDATED_ON @"fb_last_updated_on"
#define FACEBOOK_POST_ENABLED @"fb_post_enabled"


/// API CMD
#define SIGNUP_USER @"signup_user"
#define AUTHENTICATION @"verify_user"
#define RESEND_CODE @"resend_verification_code"
#define SIGNIN_USER @"signin_user"
#define FORGOT_PASSWORD_SEND_OTP_USER @"forgot_password_send_otp_user"
#define FORGOT_PASSWORD_VERIFY_OTP_USER  @"forgot_password_verify_otp_user"
#define UPDATE_MY_PROFILE @"update_myprofile"
#define CATEGORY_LIST @"category_list"
#define INVITE_ON_APP @"invite_on_app"
#define INVITE_ON_PROJECT @""

// user details
#define DISPLAY_NAME @"display_name"
#define FIRST_NAME @"first_name"
#define EMAIL @"email"
#define LAST_NAME @"last_name"
#define NOTIFY_PREF @"notify_pref"
#define PHONE @"phone"
#define PROFILE_PIC_URL @"profile_pic_url"
#define USER_ID @"user_id"
#define USER_TYPE @"user_type"
#define ZIPCODE @"zipcode"
#define ADDRESS @"address"
#define ABOUT_ME @"about_me"
#define USER_CATEGORY @"user_category"
#define location_country_code @"91"
#define PASSWORD @"pwd"
#define PROFILE_PIC_NAME @"profile_picture_name"
#define POST_CONTACT_TYPE @"post_contact_type"
#define POST_CONTACT_ID @"post_contact_id"

//check Response Status
#define STATUS_OK @"ok"


// error messages
#define NETWORK_NOT_AVAILABLE @"network not available"
//#define

#endif
