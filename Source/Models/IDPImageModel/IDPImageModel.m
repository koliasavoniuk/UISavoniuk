//
//  IDPImageModel.m
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPImageModel.h"

#import "IDPMacro.h"

@interface IDPImageModel ()
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   IDPCache    *cache;

- (NSOperation *)imageLoadingOperation;

@end

@implementation IDPImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    
    self.cache = [IDPCache sharedCache];
    self.url = url;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setImage:(UIImage *)image {
    if (image != _image) {
        _image = image;
        
        self.state = (image) ? IDPModelDidLoad : IDPModelDidFailLoadingWithError;
    }
}

@end
