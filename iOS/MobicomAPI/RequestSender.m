//
//  RequestSender.m
//  MobicomAPITest
//
//  Created by User on 5/25/13.
//  Copyright (c) 2013 munkhochir. All rights reserved.
//

#import "RequestSender.h"
#import "NSURLRequest+IgnoreSSL.h"

@implementation RequestSender
+ (NSString*) sendPost:(NSString*)url :(NSString*)body :(NSDictionary*) header :(NSError*) error
{
    NSLog(@"%@",url);
    NSData* postData = [body dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString* postLength = [NSString stringWithFormat:@"%ld", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    if ([url hasPrefix:@"https"]) {
        [NSURLRequest allowsAnyHTTPSCertificateForHost:url];
    }
    if(header !=nil) {
        for(id key in header){
            NSString* value = [header valueForKey:key];
            [request setValue:value forHTTPHeaderField:key];
        }
    }
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: postData];
    [request setValue:postLength forHTTPHeaderField:@"Content-Lenth"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    if (!response) {
        NSLog(@"Error on sending POST request %@",error);
        return nil;
    }
    return [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
}

+(NSString*)sendGet:(NSString *)url :(NSError*) error
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSData* response = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    if (!response) {
        NSLog(@"Error on sending GET request %@",error);
        return nil;
    }
    return [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
}
@end
