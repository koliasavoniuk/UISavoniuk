//
//  IDPArrayModel.m
//  UITask1
//
//  Created by Student002 on 6/23/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPArrayModel.h"

#import "IDPChangeModel.h"
#import "IDPModelObserver.h"
#import "NSMutableArray+IDPExtensions.h"

@interface IDPArrayModel()
@property (nonatomic, strong)   NSMutableArray  *mutableObjectsArray;

@end

@implementation IDPArrayModel

@dynamic objectsArray;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjectsArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)objectsArray {
    @synchronized (self) {
        return [self.mutableObjectsArray copy];
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return self.mutableObjectsArray.count;
    }
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    if (!object) {
        return;
    }
    
    @synchronized (self) {
        [self.mutableObjectsArray addObject:object];
        NSMutableArray *array = self.mutableObjectsArray;
        IDPChangeModel *changeModel = [IDPChangeModel addArrayChangeWithIndex:[array indexOfObject:object]];
        [self notifyOfArrayChangeWithObject:changeModel];
    }
}

- (void)addObjects:(NSArray *)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        NSMutableArray *array = self.mutableObjectsArray;
        NSUInteger index = [array indexOfObject:object];
        
        [self.mutableObjectsArray removeObject:object];
        
        IDPChangeModel *changeModel = [IDPChangeModel removeArrayChangeWithIndex:index];
        
        [self notifyOfArrayChangeWithObject:changeModel];
    }
}

- (void)removeObjects:(NSArray *)objects {
    for (id object in objects) {
        [self removeObject:object];
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.mutableObjectsArray[index];
}

- (NSUInteger)indexOfObject:(id)object {
    return [self.mutableObjectsArray indexOfObject:object];
}

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex withIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        NSMutableArray *array = self.mutableObjectsArray;

        [self.mutableObjectsArray removeObjectByIndex:sourceIndex insertNewByIndex:destinationIndex inArray:array];
        
        IDPChangeModel *changeModel = [IDPChangeModel moveArrayChangeWithSourceIndex:sourceIndex destinationIndex:destinationIndex];
        
        [self notifyOfArrayChangeWithObject:changeModel];
    }
}

#pragma mark -
#pragma mark Private

- (void)notifyOfArrayChangeWithObject:(id)object {
    [self notifyOfState:IDPArrayModelDidChange withObject:object];
}

#pragma mark -
#pragma mark ObservableObject Method Override

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case IDPArrayModelDidChange:
            return @selector(model:didChangeWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
