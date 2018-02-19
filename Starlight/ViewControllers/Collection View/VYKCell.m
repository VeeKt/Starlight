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
//        self.vykImage.image = [UIImage imageNamed:@"photo2.jpeg"];
        [self.contentView addSubview:self.vykImage];
    }
    return self;
}

@end

/*
 #pragma mark - Initialization
 
 - (instancetype)initWithFrame:(CGRect)frame
 {
 if (self = [super initWithFrame:frame])
 {
 self.backgroundColor = [UIColor blackColor];
 
 self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
 self.textLabel.textAlignment = NSTextAlignmentCenter;
 self.textLabel.font = [UIFont boldSystemFontOfSize:14];
 self.textLabel.textColor = [UIColor whiteColor];
 [self.contentView addSubview:self.textLabel];
 }
 
 return self;
 }
 
 
 #pragma mark - Overriden UICollectionViewCell methods
 
 -(void)prepareForReuse
 {
 [super prepareForReuse];
 
 self.text = @"";
 }
 
 
 #pragma mark - Overriden properties
 
 -(void)setText:(NSString *)text
 {
 _text = text;
 self.textLabel.text = text;
 }
 
 @end

*/
