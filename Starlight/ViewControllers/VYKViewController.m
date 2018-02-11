//
//  VYKViewController.m
//  Starlight
//
//  Created by Victoria on 30.01.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKViewController.h"
#import "VYKPhoneMemoryViewController.h"
#import "VYKTakePhotoViewController.h"
#import "VYKAppLibraryViewController.h"
#import "Constants.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface VYKViewController ()

@property (nonatomic, strong) UIButton *phoneMemoryButton;
@property (nonatomic, strong) UIButton *makePhotoButton;
@property (nonatomic, strong) UIButton *socialNetworkButton;
@property (nonatomic, strong) UIButton *appLibraryButton;
@property (nonatomic, strong) UILabel *welcomeLabel;
@property (nonatomic, strong) NSError *error;
@property (nonatomic) BOOL isCancelledResult;
@property (nonatomic, strong) UIButton *socialNetworkPhotoGalleryButton;

@end

@implementation VYKViewController


#pragma  mark - view controller methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
    
    self.error = [NSError new];
    self.error = nil;
    self.isCancelledResult = NO;
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

- (void)clickOnMakePhotoButton:(id)sender
{
    VYKTakePhotoViewController *takePhotoViewController = [[VYKTakePhotoViewController alloc]
                                                           initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:takePhotoViewController animated:YES];
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
         [self createSocialNetworkPhotoGalleryButton];
         [self.socialNetworkButton setHidden:YES];
     }];
}

- (void)clickAppLibraryButton:(id)sender
{
    VYKAppLibraryViewController *appLibraryViewController = [[VYKAppLibraryViewController alloc]
                                                             initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:appLibraryViewController animated:YES];
}

- (void)clickOnSocialNetworkPhotoGalleryButton:(id)sender
{
    VYKAppLibraryViewController *socialNetworkViewController = [[VYKAppLibraryViewController alloc]
                                                                   initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:socialNetworkViewController animated:YES];
}

# pragma mark - buttons

- (UIButton *)offsetHight:(CGFloat)offsetHight
              offsetWidth:(CGFloat)offsetWidth
                    image:(UIImage *)image
    buttonBackgroundColor:(UIColor *)buttonBackgroundColor
                 selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(offsetWidth, offsetHight, sideSize, sideSize);
    button.layer.cornerRadius = 0.5 * button.bounds.size.width;
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = buttonBackgroundColor;
    return button;
}

- (void)createMakePhotoButton
{
    self.makePhotoButton = [UIButton new];
    self.makePhotoButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 offsetWidth:widthOffset image:[UIImage imageNamed:@"whiteDslr.png"] buttonBackgroundColor:[UIColor yellowColor] selector:@selector(clickOnMakePhotoButton:)];
    [self.view addSubview:self.makePhotoButton];
}

- (void)createPhoneMemoryButton
{
    self.phoneMemoryButton = [UIButton new];
    self.phoneMemoryButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 offsetWidth:CGRectGetWidth(self.view.frame) - widthOffset - sideSize image:[UIImage imageNamed:@"whiteSmartphone.png"] buttonBackgroundColor:[UIColor orangeColor] selector:@selector(clickOnPhoneMemoryButton:)];
    [self.view addSubview:self.phoneMemoryButton];
}

- (void)createSocialNetworkButton
{
    self.socialNetworkButton = [UIButton new];
    self.socialNetworkButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 + sideSize offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * widthOffset image:[UIImage imageNamed:@"fcbk.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickOnSocialNetworkButton:)];
    [self.view addSubview:self.socialNetworkButton];
}

- (void)createAppLibraryButton
{
    self.appLibraryButton = [UIButton new];
    self.appLibraryButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 - sideSize offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * widthOffset image:[UIImage imageNamed:@"library.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickAppLibraryButton:)];
    [self.view addSubview:self.appLibraryButton];
}

- (void)createSocialNetworkPhotoGalleryButton
{
    self.socialNetworkPhotoGalleryButton = [UIButton new];
    self.socialNetworkPhotoGalleryButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 + sideSize offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * widthOffset image:[UIImage imageNamed:@"fcbk.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickOnSocialNetworkPhotoGalleryButton:)];
    [self.view addSubview:self.socialNetworkPhotoGalleryButton];
}


#pragma mark - label

- (void)createWelcomeLabel
{
    self.welcomeLabel = [UILabel new];
    self.welcomeLabel.numberOfLines = 0;
    [self.welcomeLabel setFrame:CGRectMake(2 * widthOffset,
                                           CGRectGetHeight(self.view.frame)/8,
                                           CGRectGetWidth(self.view.frame) - 3 * widthOffset,
                                           CGRectGetHeight(self.view.frame)/7/*4*/)];
    [self.welcomeLabel setText:@"Welcome!\n\nLoad photo from..."];
    [self.welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.welcomeLabel];
}

@end
