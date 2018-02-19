//
//  VYKCell.m
//  Starlight
//
//  Created by Victoria on 17.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKCell.h"

@implementation VYKCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.vykImage];
    }
    return self;
}

@end
