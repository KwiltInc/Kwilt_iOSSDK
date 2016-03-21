//
//  KwiltImageItem.h
//  Kwilt SDK
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

#define KWILT_IMAGE_ITEM_SOURCE_KEY @"source"

@interface KwiltImageItem : NSObject

//If store the id of the kwilt item (for local localidentifier from iOS)
@property(nonatomic, assign) NSString *kwiltItemID;

//If YES the image is stored locally
@property(nonatomic, assign) BOOL isStoredLocal;

//This will hold a low quality thumbnail image
@property(nonatomic, retain) UIImage *thumbnail;

//this will hold the information of the images
//source - hold the source url of the remote image, when isStoredLocal = NO
//       - hold the PHAsset for the local image, when isStoredLocal = YES
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
