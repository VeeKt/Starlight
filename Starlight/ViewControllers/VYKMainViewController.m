//
//  VYKViewController.m
//  Starlight
//
//  Created by Victoria on 30.01.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKMainViewController.h"
#import "VYKPhoneMemoryViewController.h"
#import "VYKCameraViewController.h"
#import "VYKViewController.h"

#import "Constants.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "VYKAppLibraryController.h"


@interface VYKMainViewController ()

@property (nonatomic, strong) UIButton *phoneMemoryButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *socialNetworkSignInButton;
@property (nonatomic, strong) UIButton *socialNetworkUserPhotosButton;
@property (nonatomic, strong) UIButton *appLibraryButton;
@property (nonatomic, strong) UILabel *welcomeLabel;

@end

@implementation VYKMainViewController


#pragma  mark - view controller methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.welcomeLabel.text = @"Load photo from other place...";
}


#pragma  mark - ui

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Starlight";
    
    [self createWelcomeLabel];
    [self createMakePhotoButton];
    [self createPhoneMemoryButton];
    [self createSocialNetworkButton];
    [self createAppLibraryButton];
}


#pragma mark - selectors

- (void)clickOnCameraButton:(id)sender
{
    VYKCameraViewController *cameraViewController = [[VYKCameraViewController alloc]
                                                           initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:cameraViewController animated:YES];
}

- (void)clickOnPhoneMemoryButton:(id)sender
{
    VYKPhoneMemoryViewController *phoneMemoryViewController = [[VYKPhoneMemoryViewController alloc]
                                                               initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:phoneMemoryViewController animated:YES];
}

- (void)clickOnSocialNetworkButton:(id)sender
{
    FBSDKLoginManager *login = [FBSDKLoginManager new];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         
//do smth with it!!!!
         if(error)
         {
             return;
         }
         if (result.isCancelled)
         {
             return;
         }
         [self createSocialNetworkPhotoGalleryButton];
         [self.socialNetworkSignInButton setHidden:YES];
     }];
}

- (void)clickOnButtonToPhotoLib:(id)sender
{
//    VYKAppLibraryController *libraryController = [[VYKAppLibraryController alloc] init];
//    self.delegate = libraryController;
//    [self.delegate isSucsessfulRequest:self];
    
    VYKViewController *collection = [[VYKViewController alloc] init];
    [self.navigationController pushViewController:collection animated:YES];
    /////////
    /////////
    /////////
}

//- (void)clickOnSocialNetworkPhotoGalleryButton:(id)sender
//{
//    VYKAppLibraryViewController *socialNetworkViewController = [[VYKAppLibraryViewController alloc]
//                                                                   initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:socialNetworkViewController animated:YES];
//}

# pragma mark - buttons

- (UIButton *)offsetHight:(CGFloat)offsetHight
              offsetWidth:(CGFloat)offsetWidth
                    image:(UIImage *)image
    buttonBackgroundColor:(UIColor *)buttonBackgroundColor
                 selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    button.frame = CGRectMake(offsetWidth, offsetHight, kVYKSquareSideSize, kVYKSquareSideSize);
    button.layer.cornerRadius = 0.5 * button.bounds.size.width;
    
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = buttonBackgroundColor;
    
    return button;
}

- (void)createMakePhotoButton
{
    self.cameraButton = [UIButton new];
    self.cameraButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2
                              offsetWidth:kVYKWidthOffset
                                    image:[UIImage imageNamed:@"whiteDslr.png"]
                    buttonBackgroundColor:[UIColor yellowColor]
                                 selector:@selector(clickOnCameraButton:)];
    [self.view addSubview:self.cameraButton];
}

- (void)createPhoneMemoryButton
{
    self.phoneMemoryButton = [UIButton new];
    self.phoneMemoryButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2
                                   offsetWidth:CGRectGetWidth(self.view.frame) - kVYKWidthOffset - kVYKSquareSideSize
                                         image:[UIImage imageNamed:@"whiteSmartphone.png"]
                         buttonBackgroundColor:[UIColor orangeColor]
                                      selector:@selector(clickOnPhoneMemoryButton:)];
    [self.view addSubview:self.phoneMemoryButton];
}

- (void)createSocialNetworkButton
{
    self.socialNetworkSignInButton = [UIButton new];
    self.socialNetworkSignInButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 + kVYKSquareSideSize
                                     offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * kVYKWidthOffset
                                           image:[UIImage imageNamed:@"fcbk.png"]
                           buttonBackgroundColor:[UIColor lightGrayColor]
                                        selector:@selector(clickOnSocialNetworkButton:)];
    [self.view addSubview:self.socialNetworkSignInButton];
}

- (void)createAppLibraryButton
{
    self.appLibraryButton = [UIButton new];
    self.appLibraryButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 - kVYKSquareSideSize
                                  offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * kVYKWidthOffset
                                        image:[UIImage imageNamed:@"library.png"]
                        buttonBackgroundColor:[UIColor lightGrayColor]
                                     selector:@selector(clickOnButtonToPhotoLib:)];
    [self.view addSubview:self.appLibraryButton];
}

- (void)createSocialNetworkPhotoGalleryButton
{
    self.socialNetworkUserPhotosButton = [UIButton new];
    self.socialNetworkUserPhotosButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 + kVYKSquareSideSize
                                                 offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * kVYKWidthOffset
                                                       image:[UIImage imageNamed:@"fcbk.png"]
                                       buttonBackgroundColor:[UIColor lightGrayColor]
                                                    selector:@selector(clickOnButtonToPhotoLib:)];
    [self.view addSubview:self.socialNetworkUserPhotosButton];
}


#pragma mark - label

- (void)createWelcomeLabel
{
    self.welcomeLabel = [UILabel new];
    self.welcomeLabel.numberOfLines = 0;
    [self.welcomeLabel setFrame:CGRectMake(2 * kVYKWidthOffset,
                                           CGRectGetHeight(self.view.frame)/8,
                                           CGRectGetWidth(self.view.frame) - 3 * kVYKWidthOffset,
                                           CGRectGetHeight(self.view.frame)/7/*4*/)];
    [self.welcomeLabel setText:@"Welcome!\n\nLoad photo from..."];
    [self.welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.welcomeLabel];
}

@end
