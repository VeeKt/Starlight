//
//  VYKSecureTextField.m
//  Starlight
//
//  Created by Victoria on 06.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKSecureTextField.h"

@implementation VYKSecureTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    if(self.secureTextEntry)
    {
        [self addTarget:self action:@selector(editingDidFinished) forControlEvents:UIControlEventAllEditingEvents];
//        [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//        [self addTarget:self action:@selector(editingDidChange) forControlEvents:UIControlEventEditingChanged];
//        [self addTarget:self action:@selector(editingDidFinished) forControlEvents:UIControlEventEditingDidEnd];
    }
}

- (NSString *)text
{
    if (self.editing || self.vykSecure == NO)
    {
        return [super text];
    }
    else
    {
        return self.vykCurrentText;
    }
}

- (void)editingDidBegin
{
    self.secureTextEntry = YES;
    self.text = self.vykCurrentText;
}

- (void)editingDidChange
{
    self.vykCurrentText = self.text;
}

- (void)editingDidFinished
{
    self.secureTextEntry = NO;
    self.vykCurrentText = self.text;
    self.text = [self dotPlaceholder];
}

- (NSString *)dotPlaceholder
{
    int index = 0;
    NSMutableString *dots = @"".mutableCopy;
    while (index < self.vykCurrentText.length)
    {
        [dots appendString:@"*"];
        index++;
    }
    return dots;
}

@end
