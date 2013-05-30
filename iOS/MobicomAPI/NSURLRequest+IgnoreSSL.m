//
//  NSURLRequest+IgnoreSSL.m
//  IOSTest
//
//  Created by User on 5/31/13.
//  Copyright (c) 2013 munkhochir. All rights reserved.
//

#import "NSURLRequest+IgnoreSSL.h"

@implementation NSURLRequest (IgnoreSSL)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host
{
    return YES;
}
@end
