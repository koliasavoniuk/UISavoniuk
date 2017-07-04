//
//  IDPChangeModel.m
//  UITask1
//
//  Created by Student002 on 6/23/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPChangeModel.h"

#import "IDPChangeModelProtected.h"

#import "IDPChangeAdd.h"
#import "IDPChangeRemove.h"
#import "IDPChangeMove.h"

@implementation IDPChangeModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)addArrayChangeWithIndex:(NSUInteger)index {
    return [[IDPChangeAdd alloc] initWithIndex:index];
}

+ (instancetype)removeArrayChangeWithIndex:(NSUInteger)index {
    return [[IDPChangeRemove alloc] initWithIndex:index];
}

+ (instancetype)moveArrayChangeWithSourceIndex:(NSUInteger)sourceIndex destinationIndex:(NSUInteger)destinationIndex {
    return [[IDPChangeMove alloc] initMoveArrayChangeWithSourceIndex:sourceIndex destinationIndex:destinationIndex];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    self.index = index;
    
    return self;
}


@end
