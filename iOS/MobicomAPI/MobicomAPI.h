//
//  MobicomAPI.h
//  MobicomAPITest
//
//  Created by User on 5/25/13.
//  Copyright (c) 2013 munkhochir. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MobicomAPI : NSObject
+ (void) auth;
+ (NSString*) token:(NSString*) code;
+ (NSString*) hitoneView: (NSString*) token;
+ (NSString*) fnfList: (NSString*) token;
@end
