//
//  MobicomAPI.m
//  MobicomAPITest
//
//  Created by User on 5/25/13.
//  Copyright (c) 2013 munkhochir. All rights reserved.
//

#import "MobicomAPI.h"
#import "RequestSender.h"
static NSString* clientId = @"3fe5cf7d1fbd085b";
static NSString* clientSecret = @"e3d00e18-236f-43d6-93ef-d2a599eaf813";
static NSString* authUrl = @"https://api.mobicom.mn/oauth/v1/authorizer/authz?response_type=code&client_id=%@&redirect_uri=%@";
static NSString* tokenUrl = @"http://api.mobicom.mn/oauth/v1/tokenizer/token?grant_type=authorization_code&client_id=%@&client_secret=%@&redirect_uri=%@&code=%@";
static NSString* callback = @"http://app-forward.appspot.com/mn.lmo.mobicomapp";
static NSString* hitoneViewScope = @"http://api.mobicom.mn/oauth/v1/resource/hitone/list?access_token=%@";
static NSString* fnfListScope = @"http://api.mobicom.mn/oauth/v1/resource/fnf/list?access_token=%@";
@implementation MobicomAPI
+ (void) auth {
    NSString* redUrl = [callback stringByAppendingString: @""];
    NSString* urlStr = [NSString stringWithFormat:authUrl, clientId, redUrl];
    NSLog(@"%@",urlStr);
    NSURL* url = [NSURL URLWithString:urlStr];
    if (![[UIApplication sharedApplication] openURL:url]){
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
    }
}
+ (NSString*) token: (NSString*) code {
    NSString* redUrl = [callback stringByAppendingString: @""];
    NSString* response = [RequestSender sendPost:[NSString stringWithFormat:tokenUrl, clientId, clientSecret, redUrl,code] :@"" :nil: nil];
    NSData* jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData options:(kNilOptions) error:(&error)];
    if(error) {
        NSLog(@"Error on token: %@", error);
        return nil;
    }
    NSString* token = [json valueForKey:@"access_token"];
    return token;
}
+ (NSString*) hitoneView: (NSString*) token {
    NSError* error;
    NSString* response = [RequestSender sendPost:[NSString stringWithFormat:hitoneViewScope, token] :@"" :nil :error];
    if(error){
        NSLog(@"Error on hitoneView: %@", error);
        return nil;
    }
    return response;
}
+ (NSString*) fnfList: (NSString*) token {
    NSError* error;
    NSString* response = [RequestSender sendPost:[NSString stringWithFormat:fnfListScope, token] :@"" :nil :error];
    if(error){
        NSLog(@"Error on hitoneView: %@", error);
        return nil;
    }
    return response;
}
@end
