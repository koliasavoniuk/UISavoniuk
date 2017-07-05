//
//  IDPInternetImageModel.m
//  UITask1
//
//  Created by Student002 on 7/4/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPInternetImageModel.h"

#import "IDPGCDWrapper.h"
#import "NSURL+IDPExtensions.h"

@interface IDPInternetImageModel ()
@property (nonatomic, strong)       NSURLSessionDownloadTask    *sessionTask;

@end

@implementation IDPInternetImageModel

#pragma mark -
#pragma mark Accessors

- (void)dealloc {
    self.sessionTask = nil;
}

#pragma mark -
#pragma mark Override Methods

- (void)loadWithCompletion:(void (^)(UIImage *, id))block {
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    self.sessionTask = [urlSession downloadTaskWithURL:self.url
                                     completionHandler:^(NSURL *location,
                                                         NSURLResponse *response,
                                                         NSError *error)
                        {
                            NSFileManager *manager = [NSFileManager defaultManager];
                            NSURL *localURL = [NSURL localURLFromNetworkURL:self.url];
                            [manager moveItemAtURL:location toURL:localURL error:nil];
                            
                            UIImage *image = [UIImage imageWithContentsOfFile:localURL.path];
                            block(image, nil);
                        }];
    
    [self.sessionTask resume];
}

@end
