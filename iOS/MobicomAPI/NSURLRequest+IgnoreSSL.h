//
//  NSURLRequest+IgnoreSSL.h
//  IOSTest
//
//  Created by User on 5/31/13.
//  Copyright (c) 2013 munkhochir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (IgnoreSSL)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
@end
