//
//  VYKSlider+Filter.h
//  Starlight
//
//  Created by Victoria on 20.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <CoreImage/CoreImage.h>

@class UIImage;

@interface VYKSlider_Filter : CIFilter

- (CGImageRef)imageWithFilter:(NSString *)name forKey:(NSString *)key withSliderValue:(float)value;

@property (nonatomic, strong) UIImage *inputImage;

@end
