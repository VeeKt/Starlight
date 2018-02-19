//
//  VYKAppLibraryViewController.h
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VYKAppLibraryViewController;

@protocol VYKAppLibraryViewControllerDelegate

- (BOOL)isSucsessfulRequest:(VYKAppLibraryViewController *)appLibraryController;

@end

@interface VYKAppLibraryViewController : UIViewController

@property (nonatomic, weak) id<VYKAppLibraryViewControllerDelegate> delegate;

@end
