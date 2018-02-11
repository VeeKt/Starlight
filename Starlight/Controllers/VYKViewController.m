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
#import "VYKSocialNetworkViewController.h"
#import "Constants.h"

#import "VYKRoundButton.h"

@interface VYKViewController ()

//@property (nonatomic, strong) UIButton *phoneMemoryButton;
//@property (nonatomic, strong) UIButton *makePhotoButton;
//@property (nonatomic, strong) UIButton *socialNetworkButton;
@property (nonatomic, strong) UILabel *welcomeLabel;
@property (nonatomic, strong) VYKRoundButton *phoneMemoryButton;
@property (nonatomic, strong) VYKRoundButton *makePhotoButton;
@property (nonatomic, strong) VYKRoundButton *socialNetworkButton;

@end

@implementation VYKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Starlight";
    
    [self createWelcomeLabel];
    [self createMakePhotoButton];
    [self createPhoneMemoryButton];
    [self createSocialNetworkButton];
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
    VYKSocialNetworkViewController *socialNetworkViewController = [[VYKSocialNetworkViewController alloc]
                                                                   initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:socialNetworkViewController animated:YES];
}


# pragma mark - buttons

//- (UIButton *)offsetHight:(CGFloat)offsetHight
//              offsetWidth:(CGFloat)offsetWidth
//                    image:(UIImage *)image
//    buttonBackgroundColor:(UIColor *)buttonBackgroundColor
//                 selector:(SEL)selector
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
//    button.frame = CGRectMake(offsetWidth, offsetHight, sideSize, sideSize);
//    button.layer.cornerRadius = 0.5 * button.bounds.size.width;
//    [button setImage:image forState:UIControlStateNormal];
//    button.backgroundColor = buttonBackgroundColor;
//    return button;
//}

- (void)createMakePhotoButton
{
    self.makePhotoButton = [UIButton new];
    self.makePhotoButton.vykOffsetHieghtButton = CGRectGetHeight(self.view.frame)/2 - 25;
    self.makePhotoButton.vykOffsetWidthButton = widthOffset;
    self.makePhotoButton.vykColor = [UIColor yellowColor];
    self.makePhotoButton.vykImage = [UIImage imageNamed:@"whiteDslr.png"];
    self.makePhotoButton.vykClickOnButton = @selector(clickOnMakePhotoButton:);
    self.makePhotoButton = [self.makePhotoButton initWithFrame:CGRectMake(self.makePhotoButton.vykOffsetWidthButton, self.makePhotoButton.vykOffsetHieghtButton, 100, 100)];
    [self.view addSubview:self.makePhotoButton];
}

- (void)createPhoneMemoryButton
{
    self.phoneMemoryButton = [VYKRoundButton new];
    self.phoneMemoryButton.vykOffsetHieghtButton = CGRectGetHeight(self.view.frame)/2 - 25;
    self.phoneMemoryButton.vykOffsetWidthButton = CGRectGetWidth(self.view.frame) - widthOffset - sideSize;
    self.phoneMemoryButton.vykColor = [UIColor orangeColor];
    self.phoneMemoryButton.vykImage = [UIImage imageNamed:@"whiteSmartphone.png"];
    self.phoneMemoryButton.vykClickOnButton = @selector(clickOnPhoneMemoryButton:);
    self.phoneMemoryButton = [self.phoneMemoryButton initWithFrame:CGRectMake(self.phoneMemoryButton.vykOffsetWidthButton, self.phoneMemoryButton.vykOffsetHieghtButton, 100, 100)];
    [self.view addSubview:self.phoneMemoryButton];
}

- (void)createSocialNetworkButton
{
    self.socialNetworkButton = [VYKRoundButton new];
    self.socialNetworkButton.vykOffsetHieghtButton = CGRectGetHeight(self.view.frame)/2 + sideSize;
    self.socialNetworkButton.vykOffsetWidthButton = CGRectGetWidth(self.view.frame)/2 - 2.2 * widthOffset;
    self.socialNetworkButton.vykColor = [UIColor lightGrayColor];
    self.socialNetworkButton.vykImage = [UIImage imageNamed:@"fcbk.png"];
    self.socialNetworkButton.vykClickOnButton = @selector(clickOnSocialNetworkButton:);
    self.socialNetworkButton = [self.socialNetworkButton initWithFrame:CGRectMake(self.socialNetworkButton.vykOffsetWidthButton, self.socialNetworkButton.vykOffsetHieghtButton, 100, 100)];
    [self.view addSubview:self.socialNetworkButton];
}


#pragma mark - label

- (void)createWelcomeLabel
{
    self.welcomeLabel = [UILabel new];
    self.welcomeLabel.numberOfLines = 0;
    [self.welcomeLabel setFrame:CGRectMake(2 * widthOffset,
                                           CGRectGetHeight(self.view.frame)/5,
                                           CGRectGetWidth(self.view.frame) - 3 * widthOffset,
                                           CGRectGetHeight(self.view.frame)/4)];
    [self.welcomeLabel setText:@"Welcome!\n\nLoad photo from..."];
    [self.welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.welcomeLabel];
}

@end
