//
//  KwiltImageItem.h
//  KwiltSDK
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

#define KWILT_IMAGE_ITEM_SOURCE_KEY @"source"

@interface KwiltImageItem : NSObject

//A unique identifier for the kwilt image item
@property(nonatomic, assign) NSString *kwiltItemID;

//Determines if the kwilt image item refers to an image stored on the local device
@property(nonatomic, assign) BOOL isStoredLocal;

//Points to a thumbnail of the image
@property(nonatomic, retain) UIImage *thumbnail;

//A list of key-value pair dictionary providing more information about the image
@property(nonatomic, retain) NSDictionary *imageInfo;

/*
 * Initilize with the sourceURL for remote image
 */
- (id)initWithID:(NSString *)identifier andSourceURL:(NSString *)sourceURL;

/*
 * Initilize with the PHAsset for local image
 */
- (id)initWithAsset:(PHAsset *)asset;

@end
