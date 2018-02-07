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


@end

@implementation VYKTakePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self application:nil didFinishLaunchingWithOptions:[NSDictionary dictionary]];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (BOOL)isCameraAvailable
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    if ([self isCameraAvailable])
    {
        [self createImagePickerController];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Внимание!" message:@"На данном устройстве нет камеры." preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    return YES;
}


- (void)createImagePickerController
{
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.mediaTypes = @[(NSString *) kUTTypeImage];
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.allowsEditing = YES;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

@end
