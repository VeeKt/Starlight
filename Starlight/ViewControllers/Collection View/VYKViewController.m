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

@property (nonatomic, strong) NSMutableArray *photosMutableArray;

@end

@implementation VYKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createUI];
    
//поменять на получение данных из предыдущего контроллера или из модели
    self.photosArray = @[[UIImage imageNamed:@"photo1"], [UIImage imageNamed:@"photo2"], [UIImage imageNamed:@"photo3"], [UIImage imageNamed:@"photo4"]];
    
}


#pragma mark - data

- (void)dataInitialization
{
    self.photosMutableArray = [NSMutableArray new];
    [self.photosMutableArray addObject:[NSDate date]];
}

//- (void)copyFromMutableArray:(NSMutableArray *)mutableArray toArray:(NSArray *)array
//{
//
//}


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
    
    cell.vykImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    cell.vykImage.contentMode = UIViewContentModeScaleAspectFit;
    cell.vykImage.clipsToBounds = YES;
    cell.vykImage.image = [self.photosArray objectAtIndex:indexPath.row];
    [cell addSubview:cell.vykImage];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.photosArray.count == 0)
    {
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        backgroundImage.image = [UIImage imageNamed:@"pictures.png"];
        backgroundImage.center = self.view.center;

        [self.view addSubview:backgroundImage];

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oooops!" message:@"No photos yet :)" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    return self.photosArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *item = [self.photosArray objectAtIndex:indexPath.row];
    
    VYKItemViewController *itemViewController = [[VYKItemViewController alloc] init];
    itemViewController.photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 240)];
    itemViewController.photo.backgroundColor = [UIColor lightGrayColor];
    
//передача текущего изображения в контроллер для редактирования
    itemViewController.photo.image = item;
    
    [self.navigationController pushViewController:itemViewController animated:YES];
}


#pragma mark - collection view layout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *photoImage = [self.photosArray objectAtIndex:indexPath.row];
    CGSize imageSize = photoImage.size;
    imageSize.height /= 3;
    imageSize.width /= 3;

    return imageSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
