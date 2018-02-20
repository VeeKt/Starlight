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
//{
//    CIContext *context;
//    CIImage *beginImage;
//    CIFilter *filter;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
//    beginImage = [CIImage imageWithCGImage:self.photo.image.CGImage];
//    filter = [CIFilter filterWithName:@"CISepiaTone"];
//    [filter setValue:self.photo.image forKey:kCIInputImageKey];
//    [filter setValue:[NSNumber numberWithFloat:0] forKey:@"inputIntensity"];
//    context = [CIContext contextWithOptions:nil];
}


#pragma mark - ui

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.photo];
    


    UISlider *sliderBlur = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 160, self.view.frame.size.width - 20, 5)];
    sliderBlur.minimumValue = 0;
    sliderBlur.maximumValue = 5;
    sliderBlur.value = 0;
    [sliderBlur setContinuous:YES];
    [sliderBlur addTarget:self action:@selector(changeWhiteBalance:)
          forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:sliderBlur];

    UISlider *sliderBlack = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 100, self.view.frame.size.width - 20, 5)];
    sliderBlack.minimumValue = 0;
    sliderBlack.maximumValue = 4;
    sliderBlack.value = 1;
    [sliderBlack setContinuous:YES];
    [sliderBlack addTarget:self action:@selector(changeBlackBalance:)
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

- (void)changeWhiteBalance:(UISlider *)slider
{
//прикрутить асинхронность (медленно)
    CGFloat sliderValue = [slider value];
    
    CIImage *ciImage = [CIImage imageWithCGImage:self.photo.image.CGImage];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CIDiscBlur"]; //CIPhotoEffectFade
    [filter setValue:ciImage forKey:kCIInputImageKey];
    
    [filter setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputRadius"];
    
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImage = [UIImage imageWithCGImage:cgimg scale:1.0 orientation:self.photo.image.imageOrientation];
    CGImageRelease(cgimg);
    context = nil;
    self.photo.image = newImage;
}

- (void)changeBlackBalance:(UISlider *)slider
{

    CGFloat sliderValue = [slider value];
    
    CIImage *ciImage = [CIImage imageWithCGImage:self.photo.image.CGImage];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"]; //CIPhotoEffectFade
    [filter setValue:ciImage forKey:kCIInputImageKey];
    
    [filter setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputIntensity"];
    
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImage = [UIImage imageWithCGImage:cgimg scale:1.0 orientation:self.photo.image.imageOrientation];
    CGImageRelease(cgimg);
    context = nil;
    self.photo.image = newImage;
}

@end
