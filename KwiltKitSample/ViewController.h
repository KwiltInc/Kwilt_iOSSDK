//
//  ViewController.h
//  sdkTest
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KwiltSDK/KwiltSDK.h>

@interface ViewController : UIViewController<KwiltImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UIToolbar *toolBar;

@end
