//
//  ViewController.m
//  Starlight
//
//  Created by Victoria on 30.01.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "ViewController.h"

CGFloat widthOffset = 25;
CGFloat hightOffset = 180;
CGFloat sideSize = 110;

@interface ViewController ()

@property (nonatomic, strong) UIButton *phoneMemoryButton;
@property (nonatomic, strong) UIButton *makePhotoButton;
@property (nonatomic, strong) UIButton *facebookButton;
@property (nonatomic, strong) UILabel *welcomeLabel;

@end

@implementation ViewController

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
    [self.welcomeLabel setFrame:CGRectMake(2 * widthOffset, hightOffset/2 - 20, CGRectGetWidth(self.view.frame) - 3 * widthOffset, hightOffset/2 + 40)];
    [self.welcomeLabel setText:@"Добро пожаловать!\nВыберите изображение"];
    [self.welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.welcomeLabel];

    [self createButtonCustomStyle:self.phoneMemoryButton squareSide:sideSize offsetHight:hightOffset offsetWidth:CGRectGetWidth(self.view.frame) - widthOffset - sideSize image:[UIImage imageNamed:@"whiteSmartphone.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickOnPhoneMemoryButton:)];
    
    [self createButtonCustomStyle:self.makePhotoButton squareSide:sideSize offsetHight:hightOffset offsetWidth:widthOffset image:[UIImage imageNamed:@"whiteDslr.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickOnMakePhotoButton:)];
    
    [self createButtonCustomStyle:self.facebookButton squareSide:sideSize offsetHight:1.7 * hightOffset offsetWidth:CGRectGetWidth(self.view.frame)/2 - 2.2 * widthOffset image:[UIImage imageNamed:@"fcbk.png"] buttonBackgroundColor:[UIColor lightGrayColor] selector:@selector(clickOnFacebookButton:)];
}

- (void)clickOnMakePhotoButton:(id)sender
{
    
}

- (void)clickOnPhoneMemoryButton:(id)sender
{
    
}

- (void)clickOnFacebookButton:(id)sender
{
    
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
    
//    self.makePhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.makePhotoButton addTarget:self action:@selector(clickOnMakePhotoButton) forControlEvents:UIControlEventTouchUpInside];
//    self.makePhotoButton.frame = CGRectMake(CGRectGetWidth(self.view.frame) - widthOffset - sideSize, hightOffset, sideSize, sideSize);
//    [self.makePhotoButton setImage:[UIImage imageNamed:@"whiteDslr.png"] forState:UIControlStateNormal];
//    self.makePhotoButton.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:self.makePhotoButton];
//}

//- (void)createButtonWithBlock:(void (^)(UIButton*, CGFloat, CGFloat, CGFloat, UIColor*, SEL))createSquareButtonBlock
//{
//    self.phoneMemoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.phoneMemoryButton addTarget:self action:@selector(clickOnPhoneMemoryButton) forControlEvents:UIControlEventTouchUpInside];
//    self.phoneMemoryButton.frame = CGRectMake(widthOffset, hightOffset, sideSize, sideSize);
//    self.phoneMemoryButton.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:self.phoneMemoryButton];
//}
//
//void (^createSquareButtonBlock)(id, UIButton*, CGFloat, CGFloat, CGFloat, UIColor*, SEL) = ^(id idSelf, UIButton *button, CGFloat side, CGFloat offsetWidth, CGFloat offsetHight, UIColor *color, SEL action)
//{
//    button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button addTarget:idSelf action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
//    button.frame = CGRectMake(offsetWidth, offsetHight, side, side);
//    button.backgroundColor = color;
////    [self.view addSubview:button];
//};



//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
