//
//  RequestSender.h
//  MobicomAPITest
//
//  Created by User on 5/25/13.
//  Copyright (c) 2013 munkhochir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestSender : NSObject
+ (NSString*) sendPost:(NSString*)url :(NSString*) body :(NSDictionary*) header :(NSError*) error;
+ (NSString*) sendGet:(NSString*)url :(NSError*) error;
@end
