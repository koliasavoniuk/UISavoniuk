//
//  IDPArrayModel.h
//  UITask1
//
//  Created by Student002 on 6/23/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPObservableObject.h"

@interface IDPArrayModel : IDPObservableObject

@property (nonatomic, readonly) NSArray     *objectsArray;
@property (nonatomic, readonly) NSUInteger  count;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;

- (void)addObjects:(NSArray *)objects;
- (void)removeObjects:(NSArray *)objects;

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex withIndex:(NSUInteger)destinationIndex;

- (void)exchangeModelAtIndex:(NSUInteger)firstIndex withModelAtIndex:(NSUInteger)secondIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
