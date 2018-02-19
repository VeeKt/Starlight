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

@property (nonatomic, strong) UIImageView *itemView;

@end

@implementation VYKItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.itemView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 240)];
    self.itemView.backgroundColor = [UIColor lightGrayColor];
    self.itemView.image = [UIImage imageNamed:@"photo1.jpeg"];
    
    [self.view addSubview:self.itemView];

    UISlider *sliderWhite = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 130, self.view.frame.size.width - 20, 10)];
    sliderWhite.minimumValue = 0.0f;
    sliderWhite.maximumValue = 100.0f;
    sliderWhite.value = 50.0f;
    [sliderWhite setContinuous:YES];
    [sliderWhite addTarget:self action:@selector(changeWhiteBalance) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:sliderWhite];
    
    UISlider *sliderBlack = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 70, self.view.frame.size.width - 20, 10)];
    sliderBlack.minimumValue = 0.0f;
    sliderBlack.maximumValue = 100.0f;
    sliderBlack.value = 50.0f;
    [sliderBlack setContinuous:YES];
    [sliderBlack addTarget:self action:@selector(changeBlackBalance) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sliderBlack];
    
}

- (void)changeWhiteBalance
{
//    self.itemView.image
}

- (void)changeBlackBalance
{
    
}


/*
 /Конфигурируем collection view layout
 UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
 flowLayout.minimumInteritemSpacing = 10.0f;
 flowLayout.minimumLineSpacing = 10.0f;
 flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
 flowLayout.itemSize = CGSizeMake(50, 50);
 self.collectionView.collectionViewLayout = flowLayout;
 
 
 //Регистрируем collection view
 [self.collectionView registerClass:[SBCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
 self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
 */

@end
