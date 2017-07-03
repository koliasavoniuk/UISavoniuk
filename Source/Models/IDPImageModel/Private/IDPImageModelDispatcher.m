//
//  IDPImageModelDispatcher.m
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPImageModelDispatcher.h"

#import "IDPConstants.h"

@interface IDPImageModelDispatcher ()
@property (nonatomic, strong)   NSOperationQueue    *queue;

- (void)initQueue;

@end

@implementation IDPImageModelDispatcher

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedDispatcher {
    static dispatch_once_t onceToken;
    static id dispatcher = nil;
    dispatch_once(&onceToken, ^{
        dispatcher = [self new];
    });
    
    return dispatcher;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
}

- (instancetype)init {
    self = [super init];
    
    [self initQueue];
    
    return self;
}

- (void)initQueue {
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.maxConcurrentOperationCount = kIDPMaxConcurrentOperationCount;
    
    self.queue = queue;
}

#pragma mark -
#pragma mark Accessors

- (void)setQueue:(NSOperationQueue *)queue {
    if (_queue != queue) {
        [_queue cancelAllOperations];
        
        _queue = queue;
    }
}

@end
