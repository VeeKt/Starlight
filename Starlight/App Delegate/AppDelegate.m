//
//  AppDelegate.m
//  Starlight
//
//  Created by Victoria on 30.01.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "AppDelegate.h"
#import "VYKViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *navigationControloler;
@property (nonatomic, strong) UITabBarController *tabBarController;

@property (nonatomic, strong) VYKViewController *rootViewController;

@end

@implementation AppDelegate


#pragma  mark - app delegate metods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initWindow];
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    return YES;
}


#pragma mark - init navigation controller

- (void)initNavigationController
{
    self.rootViewController = [[VYKViewController alloc] initWithNibName:nil bundle:nil];
    self.navigationControloler = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
    self.window.rootViewController = self.navigationControloler;
    [self.window addSubview:self.navigationControloler.view];
}


# pragma mark - init window

- (void)initWindow
{
    self.window = [UIWindow new];
    self.window.tintColor = [UIColor blackColor];
    
    [self initNavigationController];
    [self.window makeKeyAndVisible];
}


#pragma mark - facebook methods

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                               annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
                    ];
    // Add any custom logic here.
    return handled;
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer
{
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self)
    {
        if (_persistentContainer == nil)
        {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Starlight"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
            {
                if (error != nil)
                {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}


#pragma mark - Core Data Saving support

- (void)saveContext
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
