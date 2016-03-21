//
//  HPImageViewController.h
//  Kwilt MediaPlayer
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kwiltsdk/KwiltImageItem.h"
#import "GestureImageView.h"

@interface ImageViewController : UIViewController

@property (strong, nonatomic) KwiltImageItem *item;

@property (weak, nonatomic) IBOutlet GestureImageView *imageView;

@end
