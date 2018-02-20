//
//  VYKItemViewController.m
//  Starlight
//
//  Created by Victoria on 19.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKItemViewController.h"
#import <CoreImage/CoreImage.h>
#import <CoreGraphics/CoreGraphics.h>

@interface VYKItemViewController ()

@end

@implementation VYKItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}


#pragma mark - ui

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.photo];

    UISlider *sliderWhite = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 160, self.view.frame.size.width - 20, 5)];
    sliderWhite.minimumValue = -1;
    sliderWhite.maximumValue = 1;
    sliderWhite.value = 0;
    [sliderWhite setContinuous:YES];
    [sliderWhite addTarget:self action:@selector(changeWhiteBalance)
          forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:sliderWhite];
    
    UISlider *sliderBlack = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 100, self.view.frame.size.width - 20, 5)];
    sliderBlack.minimumValue = 0;
    sliderBlack.maximumValue = 4;
    sliderBlack.value = 1;
    [sliderBlack setContinuous:YES];
    [sliderBlack addTarget:self action:@selector(changeBlackBalance)
          forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sliderBlack];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(10, self.view.frame.size.height - 60, self.view.frame.size.width/2 - 15, 50);
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    cancelButton.backgroundColor = [UIColor lightGrayColor];
    [cancelButton addTarget:self action:@selector(cancelEditing)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cancelButton];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.frame = CGRectMake(self.view.frame.size.width/2 + 5, self.view.frame.size.height - 60, self.view.frame.size.width/2 - 15, 50);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    saveButton.backgroundColor = [UIColor lightGrayColor];
    [saveButton addTarget:self action:@selector(savePhoto)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:saveButton];
}


#pragma mark - buttons actions

- (void)savePhoto
{
    //если фото изменено, то сохранить, выдать сообщение об успешном сохранении и вернуться в рут вью
    //сохраняем в кор дату
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)cancelEditing
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - sliders actions

- (void)changeWhiteBalance
{
    
}

- (void)changeBlackBalance
{
    
}

@end
