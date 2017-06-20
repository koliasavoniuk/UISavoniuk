//
//  IDPImageModel.m
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPImageModel.h"

@interface IDPImageModel ()
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy)   NSURL   *url;

@property (nonatomic, assign, getter=isLoaded)        BOOL loaded;

@end

@implementation IDPImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isLoaded {
    return nil != self.image;
}

#pragma mark -
#pragma mark Public

- (void)load {
    if ([self isLoaded]) {
        return;
    }
}

- (void)dump {
    self.image = nil;
}


@end
