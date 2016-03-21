//
//  HPImageViewController.h
//  Kwilt MediaPlayer
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import "GestureImageView.h"

@implementation GestureImageView

- (id) init {
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

#pragma mark - Utility Methods
//setup the gesture
- (void) setUp {
    [self setUserInteractionEnabled:TRUE];
    
    //setup pinch gesture
    pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [pinch setDelegate:self];
    [self addGestureRecognizer:pinch];
    
    //setup rotate gesture
    rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [rotate setDelegate:self];
    [self addGestureRecognizer:rotate];
    
    //setup tap gesture
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [tap setDelegate:self];
    [self addGestureRecognizer:tap];
}

//handle pinch
//scale the imageview reconizer
- (void) pinch:(UIPinchGestureRecognizer*)recogniser {
    recogniser.view.transform = CGAffineTransformScale(recogniser.view.transform, recogniser.scale, recogniser.scale);
    recogniser.scale = 1;
}

//handle rotate
//rotate the imageview reconizer
- (void) rotate:(UIRotationGestureRecognizer*)recogniser {
    recogniser.view.transform = CGAffineTransformRotate(recogniser.view.transform, recogniser.rotation);
    recogniser.rotation = 0;
}

//handle tap
//tap to reset the imageview
- (void) tap:(UITapGestureRecognizer*)recogniser {
    [self reset:TRUE];
}

//reset the imageview back to orginal state
- (void) reset:(BOOL)animation {
    [UIView animateWithDuration:animation ? .25 : 0.0f animations:^{
        self.transform = CGAffineTransformIdentity;
        self.center = self.superview.center;
    }];
}

#pragma mark - UIGestureRecognizer Delegate Methods
//allow gesture on imageview
- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return TRUE;
}

@end
