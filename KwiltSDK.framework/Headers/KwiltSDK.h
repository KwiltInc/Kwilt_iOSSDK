//
//  KwiltSDK.h
//  KwiltSDK
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KwiltHelper.h"
#import "KwiltImageItem.h"
#import "KwiltImagePickerController.h"

#define KWILTSDK_VERSION_STRING "0.9.2 Beta"

#import <kwiltsdk/KwiltImagePickerController.h>

@interface KwiltSDK : NSObject <NSURLConnectionDelegate>

+ (instancetype)sharedInstance;

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end
