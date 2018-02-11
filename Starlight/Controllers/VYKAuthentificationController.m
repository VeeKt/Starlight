//
//  VYKAuthentificationController.m
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKAuthentificationController.h"

@interface VYKAuthentificationController ()

@property (nonatomic, strong) NSArray *vykProfilePhotosArray;
//@property (nonatomic, strong) NSDictionary *params;

@end

@implementation VYKAuthentificationController

- (void)photosFBSDKGraphRequest
{
    NSDictionary *params = [[NSDictionary alloc] init];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"/{album-id}/photos" parameters:params HTTPMethod:@"GET"];
}

@end
