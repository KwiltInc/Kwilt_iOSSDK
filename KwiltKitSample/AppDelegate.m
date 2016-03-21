//
//  AppDelegate.m
//  KwiltKitSample
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <KwiltSDK/KwiltSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[KwiltSDK sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation
            ];
}

@end
