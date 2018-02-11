//
//  VYKRoundButton.m
//  Starlight
//
//  Created by Victoria on 10.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKRoundButton.h"
#import "Constants.h"

@implementation VYKRoundButton

- (instancetype)init
{
    return [self initWithFrame:CGRectMake(100, 100, 100, 100)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.vykImage = [UIImage imageNamed:@"star.png"];
        self.vykColor = [UIColor lightGrayColor];
//        self.vykOffsetWidthButton = widthOffset;
//        self.vykOffsetHieghtButton = hightFieldOffset;
        [self customButtonDefenition:self withHieghtOffset:self.vykOffsetHieghtButton withWidthOffset:self.vykOffsetWidthButton withImage:self.vykImage withBackgroundColor:self.vykColor];
    }
    return self;
}

- (void)customButtonDefenition:(VYKRoundButton *)button
                          withHieghtOffset:(CGFloat)offsetHight
                           withWidthOffset:(CGFloat)offsetWidth
                                 withImage:(UIImage *)image
                       withBackgroundColor:(UIColor *)buttonBackgroundColor
{
    button.frame = CGRectMake(offsetWidth, offsetHight, sideSize, sideSize);
    button.layer.cornerRadius = 0.5 * button.bounds.size.width;
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = buttonBackgroundColor;
}

@end
