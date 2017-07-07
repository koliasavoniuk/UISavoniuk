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
#import "NSFileManager+IDPExtensions.h"

@interface IDPInternetImageModel ()
@property (nonatomic, strong)       NSURLSessionDownloadTask    *sessionTask;
@property (nonatomic, strong)       NSURL                       *localPath;

@property (nonatomic, assign)   BOOL    isVeryfied;
@property (nonatomic, assign)   BOOL    isCached;

@end

@implementation IDPInternetImageModel

#pragma mark -
#pragma mark Accessors

- (void)dealloc {
    self.sessionTask = nil;
}

- (void)setSessionTask:(NSURLSessionDownloadTask *)sessionTask {
    if (_sessionTask != sessionTask) {
        [_sessionTask cancel];
        
        _sessionTask = sessionTask;
        
        [_sessionTask resume];
    }
}

- (NSURL *)localPath {
    return [self.url localURLFromNetworkURL];
}

#pragma mark -
#pragma mark Public Methods

- (BOOL)imageIsVeryfied {
    UIImage *image = [UIImage imageWithContentsOfFile:self.localPath.path];
    
    return nil != image;
}

- (BOOL)imageIsCached {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return [fileManager fileExistsAtPath:self.localPath.path];
}

#pragma mark -
#pragma mark Override Methods

- (void)loadWithCompletion:(void (^)(UIImage *, id))block {
    if (self.isCached) {
        [super loadWithCompletion:^(UIImage *image, id error){
            if (self.isVeryfied) {
                block(image, error);
            } else {
                [self removeCachedFile];
                [self downloadWithCompletion:block];
            }
        }];
    } else {
        [self downloadWithCompletion:block];
    }
}

- (void)downloadWithCompletion:(void (^)(UIImage *, id))block {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSURL *localURL = self.localPath;
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    self.sessionTask = [urlSession downloadTaskWithURL:self.url
                                     completionHandler:^(NSURL *location,
                                                         NSURLResponse *response,
                                                         NSError *error)
                        {
                            [manager moveItemAtURL:location toURL:localURL error:nil];
                            UIImage *image = [UIImage imageWithContentsOfFile:localURL.path];
                            block(image, error);
                        }];
}

@end
