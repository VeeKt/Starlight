//
//  VYKAuthentificationController.m
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKFacebookURLSessionController.h"

@interface VYKFacebookURLSessionController ()

@property (nonatomic, strong) NSArray *vykProfilePhotosArray;
//@property (nonatomic, strong) NSDictionary *params;

@end

@implementation VYKFacebookURLSessionController

- (void)albumPhotosFBSDKGraphRequest
{
    NSDictionary *params = [[NSDictionary alloc] init];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"/{album-id}/photos" parameters:params HTTPMethod:@"GET"];
}

- (void)photosFBSDKRequest
{
    
}

@end
