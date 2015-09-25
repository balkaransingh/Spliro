//
//  Macros.h
//  Utils
//
//  Created by Manish Khandelwal on 06/09/14.
//  Copyright (c) 2014 Erandoo. All rights reserved.
//

#define NSSTRING_HAS_DATA(_x) ( ((_x) != nil) && ( [(_x) length] > 0 ))
#define NSSTRING_NOT_NULL(_x) ( ( ((_x) != nil) && ![(_x) isKindOfClass:[NSNull class]] ) ? (_x) : @"" )
#define LocStr(key)[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]


//
//  ARCHelper.h
//  Utils
//
//  Created by Prakash Gupta on 21/10/13.
//  Copyright (c) 2013 Astegic. All rights reserved.
//

//  ARC Helper

#ifndef PG_RETAIN
#if __has_feature(objc_arc)
#define PG_RETAIN(x) (x)
#define PG_RELEASE(x)
#define PG_AUTORELEASE(x) (x)
#define PG_SUPER_DEALLOC
#else
#define __PG_WEAK
#define PG_WEAK assign
#define PG_RETAIN(x) [(x) retain]
#define PG_RELEASE(x) [(x) release]
#define PG_AUTORELEASE(x) [(x) autorelease]
#define PG_SUPER_DEALLOC [super dealloc]
#endif
#endif

//  Weak reference support

#ifndef PG_WEAK
#if defined __IPHONE_OS_VERSION_MIN_REQUIRED
#if __IPHONE_OS_VERSION_MIN_REQUIRED > __IPHONE_4_3
#define __PG_WEAK __weak
#define PG_WEAK weak
#else
#define __PG_WEAK __unsafe_unretained
#define PG_WEAK unsafe_unretained
#endif
#elif defined __MAC_OS_X_VERSION_MIN_REQUIRED
#if __MAC_OS_X_VERSION_MIN_REQUIRED > __MAC_10_7
#define __PG_WEAK __weak
#define PG_WEAK weak
#else
#define __PG_WEAK __unsafe_unretained
#define PG_WEAK unsafe_unretained
#endif
#endif
#endif

//  ARC Helper ends

