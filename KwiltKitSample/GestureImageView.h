//
//  HPImageViewController.h
//  Kwilt MediaPlayer
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureImageView : UIImageView <UIGestureRecognizerDelegate> {
    
@protected
    //pinch gesture
    UIPinchGestureRecognizer *pinch;
    
    //rotate gesture
    UIRotationGestureRecognizer *rotate;
    
    //tap gesture
    UITapGestureRecognizer *tap;
}

//reset the image with animation
- (void) reset:(BOOL)animation;

@end
