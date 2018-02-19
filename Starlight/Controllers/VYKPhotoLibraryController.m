//
//  VYKPhotoLibraryController.m
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKPhotoLibraryController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface VYKPhotoLibraryController ()
@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@end

@implementation VYKPhotoLibraryController

- (void)photoLibraryDidChange:(nonnull PHChange *)changeInstance {
//    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
//        //request creating an assert from image
//        PHAssetChangeRequest *createAssertRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
//        //request editing album
//        PHAssetCollectionChangeRequest *albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:album];
//        //get a placeholder for the new asset and add it to the album editing request
//        PHObjectPlaceholder *assetPlaceholder = [createAssertRequest placeholderForCreatedAssert];
//        [albumChangeRequest addAssets:@[assetPlaceholder]];
//    } completionHandler:^(BOOL success, NSError *error){
//        NSLog(@"Finished adding asset %@", (success ? @"Success" : error));
//    }];
}

//- (void)findPathToPhotoLibrary
//{
//    self.fileManager = [[NSFileManager alloc] init];
//    NSArray *urls = [self.fileManager URLsForDirectory:NSPicturesDirectory inDomains:NSUserDomainMask];
//    if ([urls count] > 0)
//    {
//        NSURL *pictureFolder = urls[0];
//        NSLog(@"%@", pictureFolder);
//    }
//    else
//    {
//        NSLog(@"Could not find Picture folder.");
//    }
//}

- (BOOL)cameraSupportMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType
{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0)
    {
        NSLog(@"Media type is empty.");
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType])
        {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}

- (BOOL)doesCameraSupportPhotoLibrary
{
    return [self cameraSupportMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

@end
