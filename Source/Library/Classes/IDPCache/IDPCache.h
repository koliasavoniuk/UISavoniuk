//
//  IDPCache.h
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDPCache : NSObject
@property (nonatomic, readonly) NSDictionary    *cacheDictionary;

+ (instancetype)sharedCache;

- (void)setObject:(id)object forKey:(id)key;
- (void)removeObjectForKey:(id)key;

- (id)modelForKey:(id)key;

@end
