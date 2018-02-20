//
//  VYKAppLibraryController.h
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VYKMainViewController.h"

@interface VYKAppLibraryController : NSObject <VYKAppLibraryViewControllerDelegate>

- (BOOL)isSucsessfulRequest:(VYKMainViewController *)appLibraryController;

@end
