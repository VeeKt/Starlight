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
    [self.welcomeLabel setText:@"Welcome!\n\nLoad photo from..."];
    [self.welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.welcomeLabel];
    
    self.phoneMemoryButton = [[UIButton alloc] init];
    self.phoneMemoryButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 - 25 offsetWidth:CGRectGetWidth(self.view.frame) - widthOffset - sideSize image:[UIImage imageNamed:@"whiteSmartphone.png"] buttonBackgroundColor:[UIColor orangeColor] selector:@selector(clickOnPhoneMemoryButton:)];
    [self.view addSubview:self.phoneMemoryButton];
    
    self.makePhotoButton = [[UIButton alloc] init];
    self.makePhotoButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 - 25 offsetWidth:widthOffset image:[UIImage imageNamed:@"whiteDslr.png"] buttonBackgroundColor:[UIColor yellowColor] selector:@selector(clickOnMakePhotoButton:)];
    [self.view addSubview:self.makePhotoButton];
    
    self.socialNetworkButton = [[UIButton alloc] init];
    self.socialNetworkButton = [self offsetHight:CGRectGetHeight(self.view.frame)/2 + sideSize offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * widthOffset image:[UIImage imageNamed:@"fcbk.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickOnSocialNetworkButton:)];
    [self.view addSubview:self.socialNetworkButton];
}

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

@end
