//
//  IDPCache.m
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPCache.h"

@interface IDPCache ()
@property (nonatomic, strong)   NSMapTable  *cacheMapTable;

@end

@implementation IDPCache

- (void)dealloc {
    self.cacheMapTable = nil;
}

- (instancetype)init {
    self = [super init];
    
    self.cacheMapTable = [NSMapTable strongToWeakObjectsMapTable];
    
    return self;
}

+ (instancetype)sharedCache {
    static dispatch_once_t onceToken;
    static IDPCache *cache = nil;
    dispatch_once(&onceToken, ^{
        cache = [IDPCache new];
    });
    
    return cache;
}

@end
