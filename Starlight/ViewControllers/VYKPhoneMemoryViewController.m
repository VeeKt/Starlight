//
//  VYKPhoneMemoryViewController.m
//  Starlight
//
//  Created by Victoria on 03.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKPhoneMemoryViewController.h"
#import "VYKPhotoLibraryController.h"

@interface VYKPhoneMemoryViewController ()

@property (nonatomic, strong) VYKPhotoLibraryController *photoLibraryController;
@property (nonatomic, strong) UIImageView *backgroundImage;
//@property (nonatomic, copy) NSString *currentState;

@end

@implementation VYKPhoneMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPhotoLibraryController];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.backgroundImage.image = [UIImage imageNamed:@"pictures.png"];
    self.backgroundImage.center = self.view.center;
    [self.view addSubview:self.backgroundImage];
    
    [self createPhotoLibraryController];
}


#pragma mark - photo library

- (void)createPhotoLibraryController
{
    self.photoLibraryController = [VYKPhotoLibraryController new];
    
    if ([self.photoLibraryController doesCameraSupportPhotoLibrary]){
        [self createTableView];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Attention!" message:@"The photo library is not available." preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


#pragma mark - table view

- (void)createTableView
{
    
}

//- (NSString *)currentState
//{
//    return self.currentState;
//}
//
//- (instancetype)initWithCurrentState
//{
//
//    return self;
//}

@end
