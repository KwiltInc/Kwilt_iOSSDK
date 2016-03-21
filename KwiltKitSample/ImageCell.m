//
//  ImageCell.m
//  Kwilt MediaPlayer
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *arrayOfViews = [bundle loadNibNamed:@"ImageCell" owner:self options:nil];
        if ([arrayOfViews count] < 1 || ![arrayOfViews[0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = arrayOfViews[0];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;    
}

- (void)prepareForReuse {
    self.imageView.image = nil;
}

@end
