//
//  VYKPhotoLibraryController.m
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKPhotoLibraryController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface VYKPhotoLibraryController ()

@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@end

@implementation VYKPhotoLibraryController

- (BOOL)isPhotoLibraryAvailable
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}


#pragma mark - photo library

- (BOOL)isCreatePhotoLibraryController
{
    if ([self isPhotoLibraryAvailable]){
        return YES;
    }
    return NO;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    if ([self isPhotoLibraryAvailable])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        
        controller.mediaTypes = mediaTypes;
        controller.delegate = self;
    }
}

@end
