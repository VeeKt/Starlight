//
//  AppDelegate.h
//  Starlight
//
//  Created by Victoria on 30.01.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic, strong) UINavigationController *navigationControloler;

@property (nonatomic, strong) ViewController *rootViewController;

- (void)saveContext;


@end

