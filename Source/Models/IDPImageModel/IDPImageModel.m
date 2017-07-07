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
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *localPath;

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
    }
    
    Class class = url.fileURL ? [IDPFileSystemImageModel class] : [IDPInternetImageModel class];
    model = [[class alloc] initWithURL:url];
    [cache setObject:model forKey:url];
    
    return model;

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
#pragma mark Public

- (void)removeCachedFile {
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager removeItemAtURL:self.localPath error:nil];
}

#pragma mark -
#pragma mark Override Methods

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
