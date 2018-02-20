//
//  VYKTakePhotoViewController.h
//  Starlight
//
//  Created by Victoria on 04.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VYKCameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// image view для захваченного изображения
@property (nonatomic, readonly) UIImageView *vykPhotoImageView;

@end
