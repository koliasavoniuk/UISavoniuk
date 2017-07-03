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
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   NSOperation *operation;

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

- (void)dealloc {
    self.operation = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    
    self.url = url;
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)loadMethods {
    self.operation = [self imageLoadingOperation];
}

- (void)dump {
    self.operation = nil;
    self.image = nil;
    self.state = IDPModelDidUnload;
}

#pragma mark -
#pragma mark Private

- (NSOperation *)imageLoadingOperation {
    IDPWeakify(self);
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        IDPStrongifyAndReturnIfNil(self);
        self.image = [UIImage imageWithContentsOfFile:self.url.path];
    }];
    
    operation.completionBlock = ^{
        IDPStrongifyAndReturnIfNil(self);
        self.state = self.image ? IDPModelDidLoad : IDPModelDidFailLoading;
    };
    
    return operation;
}

@end
