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

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.cacheMapTable = nil;
}

- (instancetype)init {
    self = [super init];
    
    self.cacheMapTable = [NSMapTable strongToWeakObjectsMapTable];
    
    return self;
}

#pragma mark -
#pragma mark Public

+ (instancetype)sharedCache {
    static dispatch_once_t onceToken;
    static IDPCache *cache = nil;
    dispatch_once(&onceToken, ^{
        cache = [IDPCache new];
    });
    
    return cache;
}

- (void)setObject:(id)object forKey:(id)key {
    [self setObject:object forKey:key];
}

- (void)removeObjectForKey:(id)key {
    [self.cacheMapTable removeObjectForKey:key];
}

- (id)modelForKey:(id)key {
    return [self.cacheMapTable objectForKey:key];
}

@end
