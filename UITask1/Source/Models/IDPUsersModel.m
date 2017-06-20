//
//  IDPUsersModel.m
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUsersModel.h"

@interface IDPUsersModel()
@property (nonatomic, strong)   NSMutableArray  *mutableUsersArray;

@end

@implementation IDPUsersModel

#pragma mark -
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    self.mutableUsersArray = [NSMutableArray array];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)usersArray {
    return [self.usersArray copy];
}

- (void)setMutableUsersArray:(NSMutableArray *)mutableUsersArray {
    if (mutableUsersArray != _mutableUsersArray) {
        _mutableUsersArray = mutableUsersArray;
    }
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    [self.mutableUsersArray addObject:object];
}

- (void)addObjects:(NSArray *)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)removeObject:(id)object {
    [self.mutableUsersArray removeObject:object];
}

- (void)removeObjects:(NSArray *)objects {
    for (id object in objects) {
        [self removeObject:object];
    }
}

- (NSUInteger)usersArrayCount {
    return self.mutableUsersArray.count;
}

- (void)exchangeUserAtIndex:(NSUInteger)firstIndex withUserByIndex:(NSUInteger)secondIndex {
    [self.mutableUsersArray exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
}

@end
