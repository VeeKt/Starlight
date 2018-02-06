//
//  VYKTakePhotoViewController.m
//  Starlight
//
//  Created by Victoria on 04.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKTakePhotoViewController.h"

@interface VYKTakePhotoViewController ()

@property (nonatomic, strong) UIImagePickerController *imagePickerController;


@end

@implementation VYKTakePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
//    [self application:nil didFinishLaunchingWithOptions:[NSDictionary dictionary]];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
}

//- (BOOL)isCameraAvailable
//{
//    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
//}
//
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
//{
//    if ([self isCameraAvailable])
//    {
//        NSLog(@"Camera is available.");
//    }
//    else
//    {
//        NSLog(@"Camera is not available.");
//    }
//    return YES;
//}


//- (void)imagePickerController
//{
//    self.imagePickerController = [[UIImagePickerController alloc] init];
//    self.imagePickerController.delegate = self;
//    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
//    self.imagePickerController.mediaTypes = @[(NSString *) kUTTypeImage];
//    self.imagePickerController.allowsEditing = YES;
//    [self presentViewController:self.imagePickerController animated:YES completion:nil];
//}

@end
