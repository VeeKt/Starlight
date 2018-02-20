//
//  VYKSlider+Filter.m
//  Starlight
//
//  Created by Victoria on 20.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKSlider+Filter.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@implementation VYKSlider_Filter

- (CGImageRef)imageWithFilter:(NSString *)name forKey:(NSString *)key withSliderValue:(float)value
{
    CIImage *ciImage = [CIImage imageWithCGImage:self.inputImage.CGImage];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:name];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    
    [filter setValue:[NSNumber numberWithFloat:value] forKey:key];
    
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];

//    UIImage *newImage = [UIImage imageWithCGImage:cgimg scale:1.0 orientation:UIImageOrientationUp];
//    CGImageRelease(cgimg);
    context = nil;
    return cgimg;
}

@end
