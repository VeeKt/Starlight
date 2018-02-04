//
//  VYKTakePhotoViewController.m
//  Starlight
//
//  Created by Victoria on 04.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKTakePhotoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface VYKTakePhotoViewController ()

@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) NSFileManager *fileManager;

@end

@implementation VYKTakePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.mediaTypes = @[(NSString *) kUTTypeImage];
    self.imagePickerController.allowsEditing = YES;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
    
    self.fileManager = [NSFileManager defaultManager];
//    if ([self.fileManager fileExistsAtPath:[]])
}

- (void)clearFileManager
{
    
}

@end
