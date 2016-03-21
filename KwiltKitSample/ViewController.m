//
//  ViewController.m
//  sdkTest
//
//  Copyright © 2014-2016 Kwilt Inc. All rights reserved.
//

#import "ImageCell.h"
#import "KwiltSDK/KwiltHelper.h"
#import "ViewController.h"
#import "ImageViewController.h"
#import "KwiltSDK/KwiltSDK.h"

#define LOAD_IMAGE_VIEW @"loadImageView"

@implementation ViewController {
    NSArray *_array;                    //hold the list of items to be displayed
    KwiltImagePickerController *_controller; //the kwilt controller or photo picker
    
    NSInteger _selectedImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //init values
    _selectedImage = -1;
    
    //initlize the array
    _array = [[NSMutableArray alloc] init];
    
    //initilize the collection view
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.pagingEnabled = YES;
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:ImageCellIdentifier];
    
    //initilize the kwilt view controller
    _controller = [[KwiltImagePickerController alloc] init];
    _controller.delegate = self;
    
    //set the background color
    self.view.backgroundColor = [UIColor colorWithRed:46.0f/255.0f green:46.0f/255.0f blue:46.0f/255.0f alpha:1.0f];
}

//show image picker by selecting the tool bar button
- (void)showKwiltImagePicker {
    NSLog( @"Launching KwiltImagePickerController from KwiltSDK version: %s", KWILTSDK_VERSION_STRING );
    [self presentViewController:_controller animated:YES completion:nil];
}

//hid the status bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}

//when the view is rotated update the bread crumb
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [self.collectionView.collectionViewLayout invalidateLayout];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) { }];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageCellIdentifier forIndexPath:indexPath];
    KwiltImageItem *item = [_array objectAtIndex:indexPath.row];
    cell.imageView.image = item.thumbnail;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //set the selected image
    _selectedImage = indexPath.row;
    
    //load the seque
    [self performSegueWithIdentifier:LOAD_IMAGE_VIEW sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:LOAD_IMAGE_VIEW] && _selectedImage >= 0)
    {
        ImageViewController *controller = [segue destinationViewController];
        controller.item = [_array objectAtIndex:_selectedImage];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPat
{
    CGFloat width = collectionView.frame.size.width/3.0f - 4.0f;
    return CGSizeMake(width, width);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}


#pragma mark collection view cell paddings

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 3.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 3.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(3.0f, 3.0f, 3.0f, 3.0f);
}


#pragma Mark - KwiltImagePickerControllerDelegate

//required : receives an array of KwiltImage objects containing info about the images selected by the user
-(void) didFinishPickingMediaWithInfo:(NSArray * _Nonnull)kwiltImageList {
    _array = kwiltImageList;
    [self.collectionView reloadData];
}

//optional : include these methods if you need more control over the look and feel of the sdk
-(NSInteger) scrollDirection {
    return UICollectionViewScrollDirectionVertical;
}

-(NSInteger) numberOfColumsOrRow {
    if ([self runningOnIpad]) {
        return 6;
    }
    return 3;
}

- (BOOL) hideRecent {
    return NO;
}

- (BOOL) hideTimeLine {
    return NO;
}

- (BOOL) hidePlace {
    return NO;
}

- (BOOL) hideSource {
    return NO;
}

- (UIColor * _Nonnull) sdkMainThemeColor {
    return [UIColor purpleColor];
}

- (UIColor * _Nonnull) sdkTextColor {
    return [UIColor whiteColor];
}

#pragma - Helper methods

-(CGSize)screenSize
{
    return [[UIScreen mainScreen] bounds].size;
}

- (BOOL) isPortrait
{
    CGSize screenSize = [self screenSize];
    return (screenSize.width < screenSize.height);
}

-(BOOL)runningOnIpad
{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

@end