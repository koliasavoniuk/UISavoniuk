//
//  IDPInternetImageModel.m
//  UITask1
//
//  Created by Student002 on 7/4/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPInternetImageModel.h"

#import "IDPGCDWrapper.h"

@implementation IDPInternetImageModel

#pragma mark -
#pragma mark Public Methods

- (void)performLoading {
    IDPImageModel *model = [self.cache modelForKey:self.url];
    if (model) {
        [super performLoading];
    } else {
        [self downloadImageFromInternet];
        [self.cache setObject:self forKey:self.url];
    }
}

- (void)downloadImageFromInternet {
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[urlSession downloadTaskWithURL:self.url
                   completionHandler:^(NSURL *location,
                                       NSURLResponse *response,
                                       NSError *error)
      {
          if (error) {
              NSLog(@"Failed downloading with error - %@", error);
              [self setState:IDPModelDidFailLoadingWithError];
          } else {
              NSData *imageData = [NSData dataWithContentsOfURL:location];
              self.image = [UIImage imageWithData:imageData];
              
              [imageData writeToFile:self.imagePath atomically:YES];
          }
      }] resume];
}


@end
