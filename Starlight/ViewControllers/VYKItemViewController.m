//
//  VYKItemViewController.m
//  Starlight
//
//  Created by Victoria on 19.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKItemViewController.h"
//#import <CoreImage/CoreImage.h>

@interface VYKItemViewController ()

@end

@implementation VYKItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.photo];

    UISlider *sliderWhite = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 160, self.view.frame.size.width - 20, 5)];
    sliderWhite.minimumValue = 0.0f;
    sliderWhite.maximumValue = 100.0f;
    sliderWhite.value = 50.0f;
    [sliderWhite setContinuous:YES];
    [sliderWhite addTarget:self action:@selector(changeWhiteBalance)
          forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:sliderWhite];
    
    UISlider *sliderBlack = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 100, self.view.frame.size.width - 20, 5)];
    sliderBlack.minimumValue = 0.0f;
    sliderBlack.maximumValue = 100.0f;
    sliderBlack.value = 50.0f;
    [sliderBlack setContinuous:YES];
    [sliderBlack addTarget:self action:@selector(changeBlackBalance)
          forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sliderBlack];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.frame = CGRectMake(10, self.view.frame.size.height - 60, self.view.frame.size.width - 20, 50);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    saveButton.backgroundColor = [UIColor lightGrayColor];
    [saveButton addTarget:self action:@selector(savePhoto)
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:saveButton];
}

- (void)savePhoto
{
    //если фото изменено, то сохранить, выдать сообщение об успешном сохранении и вернуться в рут вью
    //сохраняем в кор дату
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)changeWhiteBalance
{
    
}

- (void)changeBlackBalance
{
    
}


/*
 //Регистрируем collection view
 [self.collectionView registerClass:[SBCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
 self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
 */

@end
