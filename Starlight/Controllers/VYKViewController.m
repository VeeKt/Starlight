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

@interface VYKViewController ()

@property (nonatomic, strong) UIButton *phoneMemoryButton;
@property (nonatomic, strong) UIButton *makePhotoButton;
@property (nonatomic, strong) UIButton *socialNetworkButton;
@property (nonatomic, strong) UILabel *welcomeLabel;

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
    self.welcomeLabel = [UILabel new];
    self.welcomeLabel.numberOfLines = 0;
    [self.welcomeLabel setFrame:CGRectMake(2 * widthOffset, CGRectGetHeight(self.view.frame)/5, CGRectGetWidth(self.view.frame) - 3 * widthOffset, CGRectGetHeight(self.view.frame)/4)];
    [self.welcomeLabel setText:@"Добро пожаловать!\n\nВозьму фотки из..."];
    [self.welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.welcomeLabel];

    [self createButtonCustomStyle:self.phoneMemoryButton squareSide:sideSize offsetHight:CGRectGetHeight(self.view.frame)/2 - 25 offsetWidth:CGRectGetWidth(self.view.frame) - widthOffset - sideSize image:[UIImage imageNamed:@"whiteSmartphone.png"] buttonBackgroundColor:[UIColor orangeColor] selector:@selector(clickOnPhoneMemoryButton:)];
    
    [self createButtonCustomStyle:self.makePhotoButton squareSide:sideSize offsetHight:CGRectGetHeight(self.view.frame)/2 - 25 offsetWidth:widthOffset image:[UIImage imageNamed:@"whiteDslr.png"] buttonBackgroundColor:[UIColor yellowColor] selector:@selector(clickOnMakePhotoButton:)];
    
    [self createButtonCustomStyle:self.socialNetworkButton squareSide:sideSize offsetHight:CGRectGetHeight(self.view.frame)/2 + sideSize offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * widthOffset image:[UIImage imageNamed:@"fcbk.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickOnSocialNetworkButton:)];
}

- (void)clickOnMakePhotoButton:(id)sender
{
    VYKTakePhotoViewController *takePhotoViewController = [[VYKTakePhotoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:takePhotoViewController animated:YES];
}

- (void)clickOnPhoneMemoryButton:(id)sender
{
    VYKPhoneMemoryViewController *phoneMemoryViewController = [[VYKPhoneMemoryViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:phoneMemoryViewController animated:YES];
}

- (void)clickOnSocialNetworkButton:(id)sender
{
    VYKSocialNetworkViewController *socialNetworkViewController = [[VYKSocialNetworkViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:socialNetworkViewController animated:YES];
}

- (void)createButtonCustomStyle:(UIButton *)button squareSide:(CGFloat)squareSide offsetHight:(CGFloat)offsetHight offsetWidth:(CGFloat)offsetWidth image:(UIImage *)image buttonBackgroundColor:(UIColor *)buttonBackgroundColor selector:(SEL)selector
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(offsetWidth, offsetHight, squareSide, squareSide);
    button.layer.cornerRadius = 0.5 * button.bounds.size.width;
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = buttonBackgroundColor;
    [self.view addSubview:button];
}

@end
