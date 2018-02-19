//
//  VYKViewController.m
//  Starlight
//
//  Created by Victoria on 19.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKViewController.h"
#import "VYKCell.h"
#import "VYKItemViewController.h"


static NSString *cellIdentifier = @"Cell";

@interface VYKViewController ()

/* модель данных */
@property (nonatomic, strong) NSMutableArray *datesArray;

@end

@implementation VYKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createUI];
}


#pragma mark - data

- (void)dataInitialization
{
    self.datesArray = [NSMutableArray new];
    [self.datesArray addObject:[NSDate date]];
}


#pragma mark - ui

- (void)createUI
{
    UICollectionViewFlowLayout *viewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) collectionViewLayout:viewFlowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[VYKCell class] forCellWithReuseIdentifier:cellIdentifier];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
    [self.view addSubview:collectionView];
}


#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VYKCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.vykImage.image = [UIImage imageNamed:@"photo4.jpeg"];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    VYKItemViewController *itemView = [[VYKItemViewController alloc] init];
    [self.navigationController pushViewController:itemView animated:YES];
}


#pragma mark - collection view layout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/2 - 20, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
