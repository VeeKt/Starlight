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
#import "Item+CoreDataClass.h"
#include "AppDelegate.h"

@interface VYKItemViewController ()

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;

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
    
    [self.view addSubview:self.vykPhoto];
    


    UISlider *sliderBlur = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 160, self.view.frame.size.width - 20, 5)];
    sliderBlur.minimumValue = 0;
    sliderBlur.maximumValue = 2;
    sliderBlur.value = 0;
    [sliderBlur setContinuous:YES];
    [sliderBlur addTarget:self action:@selector(changeWhiteBalance:)
          forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:sliderBlur];

    UISlider *sliderBlack = [[UISlider alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 100, self.view.frame.size.width - 20, 5)];
    sliderBlack.minimumValue = 0;
    sliderBlack.maximumValue = 5;
    sliderBlack.value = 0;
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
    [self coreDataSaveItem];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)cancelEditing
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - sliders actions

- (void)changeWhiteBalance:(UISlider *)slider
{
        CGFloat sliderValue = [slider value];
        CIImage *ciImage = [CIImage imageWithCGImage:self.vykPhoto.image.CGImage];
        CIContext *context = [CIContext contextWithOptions:nil];
        CIFilter *filter = [CIFilter filterWithName:@"CIDiscBlur"];
        [filter setValue:ciImage forKey:kCIInputImageKey];

        [filter setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputRadius"];

        CIImage *outputImage = [filter outputImage];
        CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
        UIImage *newImage = [UIImage imageWithCGImage:cgimg scale:1.0 orientation:self.vykPhoto.image.imageOrientation];
        CGImageRelease(cgimg);
        context = nil;
        self.vykPhoto.image = newImage;
}

- (void)changeBlackBalance:(UISlider *)slider
{
    CGFloat sliderValue = [slider value];

    CIImage *ciImage = [CIImage imageWithCGImage:self.vykPhoto.image.CGImage];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"];
    [filter setValue:ciImage forKey:kCIInputImageKey];

    [filter setValue:[NSNumber numberWithFloat:sliderValue] forKey:@"inputIntensity"];

    CIImage *outputImage = [filter outputImage];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImage = [UIImage imageWithCGImage:cgimg scale:1.0 orientation:self.vykPhoto.image.imageOrientation];
    CGImageRelease(cgimg);
    context = nil;
    self.vykPhoto.image = newImage;
}

- (NSManagedObjectContext *)coreDataContext {
    if (_coreDataContext) {
        return _coreDataContext;
    }
    
    UIApplication *application = [UIApplication sharedApplication];
    NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).
    persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    return context;
}

- (void)coreDataSaveItem {
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item"
                                               inManagedObjectContext:self.coreDataContext];
    NSData *imageData = UIImageJPEGRepresentation(self.vykPhoto.image, 1.0f);
    item.image = imageData;
    
    NSError *error = nil;
    if (![item.managedObjectContext save:&error]) {
        NSLog(@"Failed saving object");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    error = nil;
    NSArray *result = [self.coreDataContext executeFetchRequest:[Item fetchRequest] error:&error];
    NSLog(@"result - %@", result);
}

@end
