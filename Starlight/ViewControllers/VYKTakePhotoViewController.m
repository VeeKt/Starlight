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
@property (nonatomic, strong) UIImage *photoImage;
@property (nonatomic, strong) UIImageView *backgroundImage;

@end

@implementation VYKTakePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self application:nil didFinishLaunchingWithOptions:[NSDictionary dictionary]];
}


#pragma mark - ui

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.photoImage = [[UIImage alloc] init];
    self.backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.backgroundImage.image = [UIImage imageNamed:@"camera.png"];
    self.backgroundImage.center = self.view.center;
    [self.view addSubview:self.backgroundImage];
}


#pragma mark - camera availability

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
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Attention!" message:@"The camera is not available." preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    return YES;
}


#pragma mark - imagePickercontroller

- (void)createImagePickerController
{
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.mediaTypes = @[(NSString *) kUTTypeImage];
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.allowsEditing = YES;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *currentImage = info[UIImagePickerControllerOriginalImage];
    if (!currentImage)
    {
        currentImage = info[UIImagePickerControllerOriginalImage];
    }
    self.photoImage = currentImage;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
