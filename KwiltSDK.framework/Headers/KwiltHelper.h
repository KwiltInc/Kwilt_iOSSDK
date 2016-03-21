//
//  KwiltHelper.h
//  Kwilt SDK
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KwiltImageItem.h"

@interface KwiltHelper : NSObject

/*
 * kwiltImageItem - Hold a reference to the item selected by the user
 * Return the image pointed by the kwiltImageItem
 */
+ (UIImage *)getKwiltImage:(KwiltImageItem *)kwiltImageItem;

@end
