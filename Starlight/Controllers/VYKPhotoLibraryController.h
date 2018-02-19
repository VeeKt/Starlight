//
//  VYKPhotoLibraryController.h
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@protocol VYKPhotoLibraryControllerDelegate
@optional
- (void)addNewAssertWithImage:(UIImage *)image toAlbum:(PHAssetCollection *)album;
@end

@interface VYKPhotoLibraryController : NSObject <VYKPhotoLibraryControllerDelegate, PHPhotoLibraryChangeObserver>
@property (nonatomic, weak) id<VYKPhotoLibraryControllerDelegate> delegate;
- (BOOL)doesCameraSupportPhotoLibrary;
@end
