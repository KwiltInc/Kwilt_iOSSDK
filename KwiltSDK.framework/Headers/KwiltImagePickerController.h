//
//  KwiltImagePickerController.h
//  Kwilt Image Picker View Controller
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KwiltImagePickerControllerDelegate <NSObject>
@required
/*
 * Sent the image source urls via NSArray
 */
- (void) didFinishPickingMediaWithInfo:(NSArray * _Nonnull)kwiltImageList;

@optional
/*
 * return UICollectionViewScrollDirection
 * indicate the scroll direction of the collection view
 * default is UICollectionViewScrollDirectionHorizontal
 */
-(NSInteger) scrollDirection;

/*
 * return integer value
 * value represent the number of columns when sdk is horizontal direction - UICollectionViewScrollDirectionHorizontal
 * value represent the number of columns when sdk is vertical direction - UICollectionViewScrollDirectionHorizontal
 */
-(NSInteger) numberOfColumsOrRow;

/*
 * return BOOL
 * YES - hide the Recent section
 * NO - show the Recent section
 */
- (BOOL) hideRecent;

/*
 * return BOOL
 * YES - hide the TimeLine section
 * NO - show the TimeLine section
 */
- (BOOL) hideTimeLine;

/*
 * return BOOL
 * YES - hide the Place section
 * NO - show the Place section
 */
- (BOOL) hidePlace;

/*
 * return BOOL
 * YES - hide the Source section
 * NO - show the Source section
 */
- (BOOL) hideSource;

/*
 * return the background color of the SDK
 */
- (UIColor * _Nonnull) sdkMainThemeColor;

/*
 * return the text color of the SDK
 */
- (UIColor * _Nonnull) sdkTextColor;

@end

@interface KwiltImagePickerController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//this delegate must be assigned when the host app uses this view controller
@property(nonatomic, weak) id<KwiltImagePickerControllerDelegate> delegate;

@end