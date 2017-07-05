//
//  IDPImageModel.m
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPImageModel.h"

#import "IDPMacro.h"
#import "IDPCache.h"
#import "IDPFileSystemImageModel.h"
#import "IDPInternetImageModel.h"

@interface IDPImageModel ()
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   IDPCache    *cache;
@property (nonatomic, strong)   UIImage     *image;

- (void)loadWithCompletion:(void(^) (UIImage *, id))block;

@end

@implementation IDPImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithURL:(NSURL *)url {
    IDPCache *cache = [IDPCache sharedCache];
    id model = [cache modelForKey:url];
    if (model) {
        return model;
    } else {
        BOOL result = [url.scheme containsString:@"http"];
        model = (result) ? [[IDPInternetImageModel alloc] initWithURL:url]
                         : [[IDPFileSystemImageModel alloc] initWithURL:url];
        
        [cache setObject:model forKey:url];
        
        return model;
    }
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.image = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];

    self.url = url;

    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setImage:(UIImage *)image {
    if (image != _image) {
        _image = image;
        
        self.state = (image) ? IDPModelDidLoad : IDPModelDidFailLoading;
    }
}

- (void)performLoading {
    [self loadWithCompletion:^(UIImage *image, id error) {
        self.image = image;
        if (error) {
            [self setState:IDPModelDidFailLoading withObject:error];
        } else {
            self.state = IDPModelDidLoad;
        }
    }];
}

- (void)loadWithCompletion:(void (^)(UIImage *, id))block {
    
}

@end
