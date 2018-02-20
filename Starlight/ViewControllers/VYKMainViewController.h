//
//  VYKViewController.h
//  Starlight
//
//  Created by Victoria on 30.01.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VYKMainViewController;
@class VYKPhoneMemoryController;

@protocol VYKAppLibraryViewControllerDelegate

- (BOOL)isSucsessfulRequest:(VYKMainViewController *)appLibraryController;

//- (BOOL)isPhoneMemoryAcsessible:(VYKPhoneMemoryController *)phoneMemoryController;

@end


@interface VYKMainViewController : UIViewController

@property (nonatomic, weak) id<VYKAppLibraryViewControllerDelegate> delegate;

@end

