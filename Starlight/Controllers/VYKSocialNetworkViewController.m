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

CGFloat widthFieldOffset = 25;
CGFloat hightFieldOffset = 50;

@interface VYKSocialNetworkViewController ()

@property (nonatomic, strong) UITextField *login;
@property (nonatomic, strong) VYKSecureTextField *passwordField;
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, copy) NSString *password;

@end

@implementation VYKSocialNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTextField:self.login hightOffset:4 * hightFieldOffset text:@" E-mail"];
    [self createTextField:self.passwordField hightOffset:6 * hightFieldOffset text:@" Password"];
//    [self.passwordField addTarget:self action:@selector(secureTextEditing:) forControlEvents:UIControlEventAllEvents];
    self.passwordField.secureTextEntry = YES;
    
    self.passwordField.rightViewMode = UITextFieldViewModeWhileEditing;
    UIButton *showTextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    showTextButton.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 3 * widthFieldOffset + 1.5f, 6 * hightFieldOffset + 1.5f, 2 * widthFieldOffset - 3.0f, hightFieldOffset - 3.0f);
    [showTextButton setImage:[UIImage imageNamed:@"hide.png"] forState:UIControlStateNormal];
    [showTextButton addTarget:self action:@selector(onShowHideButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showTextButton];
    
    self.enterButton = [[UIButton alloc] initWithFrame:CGRectMake(widthFieldOffset, 8 * hightFieldOffset, CGRectGetWidth(self.view.frame) - 2 * widthFieldOffset, hightFieldOffset)];
    [self.enterButton setBackgroundColor:[UIColor blueColor]];
    [self.enterButton setTitle:@"Войти" forState:UIControlStateNormal];
    [self.enterButton setTitleColor:[UIColor blueColor] forState:(!UIControlStateNormal)];
    [self.enterButton addTarget:self action:@selector(onEnterButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.enterButton];
}

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
    //facebook authentification
}

- (void)textFieldEditingDidBegin:(UITextField *)sender
{
    if([sender.text isEqualToString:@" E-mail"] || [sender.text isEqualToString:@" Password"])
    {
        sender.text = @"";
    }
    [sender.layer setBorderColor:[[UIColor yellowColor] CGColor]];
}

- (void) textFieldDidEndEditing:(UITextField *)sender
{
    [sender.layer setBorderColor:[[UIColor blueColor] CGColor]];
    [sender setTextColor:[UIColor darkGrayColor]];
}

- (void)createTextField:(UITextField *)textField hightOffset:(CGFloat)hight text:(NSString *)text
{
    textField = [[UITextField alloc] initWithFrame:CGRectMake(widthFieldOffset, hight, CGRectGetWidth(self.view.frame) - 2 * widthFieldOffset, hightFieldOffset)];
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

@end

//проблемы:
//пароль не заменяется на * (соответственно, не работает кнопка show/hide)
//нет проверки на корректность ввода логина и пароля
//нет класса, реализующего полключение к facebook api
//клавиатура перекрывает вьюхи
//нет картинки логотипа fasebook 
