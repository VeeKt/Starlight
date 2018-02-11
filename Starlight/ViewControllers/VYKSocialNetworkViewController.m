//
//  VYKSocialNetworkViewController.m
//  Starlight
//
//  Created by Victoria on 04.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKSocialNetworkViewController.h"
#import <UIKit/UIKit.h>
#import "VYKSecureTextField.h"
#import "Constants.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface VYKSocialNetworkViewController ()

@property (nonatomic, strong) UITextField *login;
@property (nonatomic, strong) VYKSecureTextField *passwordField;
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, strong) UIImageView *fcbkLogo;
@property (nonatomic, copy) NSString *password;

@end

@implementation VYKSocialNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}


#pragma mark - ui

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTextField:self.login
              hightOffset:3 * CGRectGetHeight(self.view.frame)/7
                     text:@" E-mail"];
    
    [self createTextField:self.passwordField
              hightOffset:4.2 * CGRectGetHeight(self.view.frame)/7
                     text:@" Password"];
    
//    [self.passwordField addTarget:self action:@selector(secureTextEditing:) forControlEvents:UIControlEventAllEvents];
    self.passwordField.secureTextEntry = YES;
    self.passwordField.rightViewMode = UITextFieldViewModeWhileEditing;
    
    [self createShowHideButton];
    [self createEnterButton];
    
    self.fcbkLogo = [[UIImageView alloc] initWithFrame:CGRectMake(widthOffset, CGRectGetHeight(self.view.frame)/6, CGRectGetWidth(self.view.frame) - 2 * widthOffset, CGRectGetHeight(self.view.frame)/6)];
    self.fcbkLogo.image = [UIImage imageNamed:@"facebookText.png"];
    [self.view addSubview:self.fcbkLogo];
}


#pragma mark - selectors

- (void)onShowHideButtonClick:(UIButton *)sender
{
//    [sender setImage:[UIImage imageNamed:@"view.png"] forState:!UIControlStateNormal];
    if(self.passwordField.secureTextEntry)
    {
        [sender setImage:[UIImage imageNamed:@"hide.png"] forState:!UIControlStateNormal];
        self.passwordField.secureTextEntry = NO;
    }
    else
    {
       [sender setImage:[UIImage imageNamed:@"view.png"] forState:!UIControlStateNormal];
        self.passwordField.enabled = NO;
        self.passwordField.secureTextEntry = YES;
        self.passwordField.enabled = YES;
    }
}

- (void)onEnterButtonClick
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}

- (void)textFieldEditingDidBegin:(UITextField *)sender
{
    if([sender.text isEqualToString:@" E-mail"] || [sender.text isEqualToString:@" Password"])
    {
        sender.text = @"";
    }
    [sender.layer setBorderColor:[[UIColor yellowColor] CGColor]];
}

- (void)textFieldDidEndEditing:(UITextField *)sender
{
    [sender.layer setBorderColor:[[UIColor blueColor] CGColor]];
    [sender setTextColor:[UIColor darkGrayColor]];
}


#pragma mark - text field

- (void)createTextField:(UITextField *)textField hightOffset:(CGFloat)hight text:(NSString *)text
{
    textField = [[UITextField alloc] initWithFrame:CGRectMake(widthOffset, hight, CGRectGetWidth(self.view.frame) - 2 * widthOffset, hightFieldOffset)];
    [textField.layer setCornerRadius:8.0f];
    [textField.layer setMasksToBounds:YES];
    [textField.layer setBorderWidth:1.5f];
    [textField.layer setBorderColor:[[UIColor blueColor] CGColor]];
    [textField setText:text];
    [textField setTextColor:[UIColor lightGrayColor]];
    [textField addTarget:self action:@selector(textFieldEditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [textField addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
    [self.view addSubview:textField];
}


#pragma mark - enter button

- (void)createEnterButton
{
    self.enterButton = [[UIButton alloc] initWithFrame:CGRectMake(widthOffset, 5 * CGRectGetHeight(self.view.frame)/6, CGRectGetWidth(self.view.frame) - 2 * widthOffset, hightFieldOffset)];
    [self.enterButton setBackgroundColor:[UIColor blueColor]];
    [self.enterButton setTitle:@"Войти" forState:UIControlStateNormal];
    [self.enterButton setTitleColor:[UIColor blueColor] forState:(!UIControlStateNormal)];
    [self.enterButton addTarget:self action:@selector(onEnterButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.enterButton];
}


#pragma mark - show/hide button

- (void)createShowHideButton
{
    UIButton *showHideButton = [UIButton buttonWithType:UIButtonTypeSystem];
    showHideButton.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 3 * widthOffset + 1.5f, 4.2 * CGRectGetHeight(self.view.frame)/7 + 1.5f, 2 * widthOffset - 3.0f, hightFieldOffset - 3.0f);
    [showHideButton setImage:[UIImage imageNamed:@"hide.png"]
                    forState:UIControlStateNormal];
    [showHideButton addTarget:self
                       action:@selector(onShowHideButtonClick:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showHideButton];
}

@end