//
//  ImageCell.h
//  Kwilt MediaPlayer
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const ImageCellIdentifier = @"ImageCellIdentifier";

@interface ImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
