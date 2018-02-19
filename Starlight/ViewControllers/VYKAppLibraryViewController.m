//
//  VYKAppLibraryViewController.m
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKAppLibraryViewController.h"
#import "Item+CoreDataClass.h"
#import "VYKAppLibraryController.h"

#import "VYKViewController.h"

@interface VYKAppLibraryViewController ()

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;

@end

@implementation VYKAppLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    // delegate implementation
//    VYKAppLibraryController *libraryController = [[VYKAppLibraryController alloc] init];
//    self.delegate = libraryController;
//    [self.delegate isSucsessfulRequest:self];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
}

//- (void)loadObjects
//{
////    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:self.coreDataContext];
////    item.name = @"pic1";
////    item.date = DISPATCH_TIME_NOW;
////
//}

@end
