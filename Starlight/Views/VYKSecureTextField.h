//
//  VYKSecureTextField.h
//  Starlight
//
//  Created by Victoria on 06.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VYKSecureTextField : UITextField

@property (nonatomic, assign) BOOL vykSecure;
@property (nonatomic, copy) NSString *vykCurrentText;

@end
