//
//  KwiltHelper.h
//  KwiltSDK
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KwiltImageItem.h"

@interface KwiltHelper : NSObject

/*
 * kwiltImageItem - Accepts a pointer to a Kwilt Image Item
 * Returns the full resolution UIImage of the image referred to by the kwiltImageItem
 */
+ (UIImage *)getKwiltImage:(KwiltImageItem *)kwiltImageItem;

@end
