//
//  IDPArrayModel.m
//  UITask1
//
//  Created by Student002 on 6/23/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPArrayModel.h"

@interface IDPArrayModel()
@property (nonatomic, strong)   NSMutableArray  *mutableModelsArray;

@end

@implementation IDPArrayModel

#pragma mark -
#pragma mark Accessors

- (NSArray *)modelsArray {
    return [self.modelsArray copy];
}

- (void)setMutableModelsArray:(NSMutableArray *)mutableModelsArray {
    if (mutableModelsArray != _mutableModelsArray) {
        _mutableModelsArray = mutableModelsArray;
    }
}

- (NSUInteger)count {
    return [self modelsArrayCount];
}

#pragma mark -
#pragma mark Private

- (NSUInteger)modelsArrayCount {
    return self.mutableModelsArray.count;
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    [self.mutableModelsArray addObject:object];
}

- (void)addObjects:(NSArray *)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)removeObject:(id)object {
    [self.mutableModelsArray removeObject:object];
}

- (void)removeObjects:(NSArray *)objects {
    for (id object in objects) {
        [self removeObject:object];
    }
}

- (void)exchangeModelAtIndex:(NSUInteger)firstIndex withModelAtIndex:(NSUInteger)secondIndex {
    [self.mutableModelsArray exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.mutableModelsArray[index];
}

@end
