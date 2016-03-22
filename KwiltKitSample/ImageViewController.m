//
//  HPImageViewController.m
//  Kwilt MediaPlayer
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import "ImageViewController.h"
#import "KwiltSDK/KwiltHelper.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialization code
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.clipsToBounds = YES;
    
    //set the background color
    self.view.backgroundColor = [UIColor colorWithRed:46.0f/255.0f green:46.0f/255.0f blue:46.0f/255.0f alpha:1.0f];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //set the image to imageview
    UIImage *image = [KwiltHelper getKwiltImage:self.item];
    self.imageView.image = image;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //reset the imageview
    self.imageView.image = nil;
}

@end
