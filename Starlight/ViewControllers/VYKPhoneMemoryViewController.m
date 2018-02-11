//
//  VYKPhoneMemoryViewController.m
//  Starlight
//
//  Created by Victoria on 03.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKPhoneMemoryViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface VYKPhoneMemoryViewController ()

@property (nonatomic, strong) NSFileManager *fileManager;
//@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@end

@implementation VYKPhoneMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
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
//
//- (BOOL)cameraSupportMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType
//{
//    __block BOOL result = NO;
//    if ([paramMediaType length] == 0)
//    {
//        NSLog(@"Media type is empty.");
//        return NO;
//    }
//    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
//    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
//        NSString *mediaType = (NSString *)obj;
//        if ([mediaType isEqualToString:paramMediaType])
//        {
//            result = YES;
//            *stop = YES;
//        }
//    }];
//    return result;
//}
//
//- (BOOL)doesCameraSupportPhotoLibrary
//{
//    return [self cameraSupportMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//}



@end
