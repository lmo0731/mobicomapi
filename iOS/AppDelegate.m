//
//  AppDelegate.m
//  IOSTest
//
//  Created by User on 5/25/13.
//  Copyright (c) 2013 munkhochir. All rights reserved.
//

#import "AppDelegate.h"
#import "MobicomAPI.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [MobicomAPI auth];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mn.lmo.mobicomapp://callback?xaxa"]];
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    NSLog(@"Entered callback");
    NSLog(@"%@",url);
    NSArray * pairs = [[url query] componentsSeparatedByString:@"&"];
    NSMutableDictionary * args = [NSMutableDictionary dictionary];
    for (NSString * pair in pairs) {
        NSArray * bits = [pair componentsSeparatedByString:@"="];
        NSString * key = [[bits objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
        NSString * value = [[bits objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
        [args setObject:value forKey:key];
    }
    NSString* code = [args valueForKey:@"code"];
    if(code){
        NSLog(@"code: %@", code);
        NSString* token = [MobicomAPI token:code];
        NSLog(@"token: %@", token);
        NSString* response = [MobicomAPI hitoneView:token];
        NSLog(@"%@",response);
        response = [MobicomAPI fnfList:token];
        NSLog(@"%@",response);
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
