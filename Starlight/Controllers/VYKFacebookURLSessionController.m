//
//  VYKAuthentificationController.m
//  Starlight
//
//  Created by Victoria on 11.02.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKFacebookURLSessionController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKPlacesKit/FBSDKPlacesKit.h>

@interface VYKFacebookURLSessionController ()
@property (nonatomic, strong) NSArray *vykProfilePhotosArray;
@property (nonatomic, assign) BOOL cancelled;
@end

@implementation VYKFacebookURLSessionController

- (void)awakeFromNib
{
//#if FIRST_STEP
    [super awakeFromNib];
}

- (void)albumPhotosFBSDKGraphRequest
{
//    NSDictionary *params = [[NSDictionary alloc] init];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"/me/photos" parameters:nil HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (self.cancelled)
        {
            return;
        }
        if (error)
        {
            return;
        }
        
        
        
        
        
        
        
        
        
    }];
    
}

- (void)photosFBSDKRequest
{
    
}

@end
