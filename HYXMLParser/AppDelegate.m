//
//  AppDelegate.m
//  HYXMLParser
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 SimonYoung. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSString *content = @"actObjNo=1765&comm=%E4%BC%91%E6%81%AF&execstatus=2&instNo=595&mdlTyp=1003&mdlTypNo=1003&messageFormat=json&objNo=15&oprIdx=1&oprTyp=00&pgmId=B2GIM91002&pkValue=883&rapid=0&tableName=YWKFWORKFORMMST&userId=LIJUAN";
    
    NSString *utf8Content = [content stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSString *chinaContent = [content stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *doubleChineContent = [chinaContent stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
