//
//  IDPUsersModel.m
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUsersModel.h"

#import "IDPUser.h"
#import "IDPConstants.h"

@interface IDPUsersModel()
@property (nonatomic, strong)   NSMutableArray  *mutableUsersArray;

@end

@implementation IDPUsersModel

#pragma mark -
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    [self createUsers:kIDPRowsInSection];
    
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
#pragma mark Private

- (instancetype)createUsers:(NSUInteger)count {
    self.mutableUsersArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [self.mutableUsersArray addObject:[IDPUser new]];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addObject:(id)object {
    [self.mutableUsersArray addObject:object];
    self.state = IDPModelArrayAddObject;
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

- (void)exchangeUserAtIndex:(NSUInteger)firstIndex withUserAtIndex:(NSUInteger)secondIndex {
    [self.mutableUsersArray exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.mutableUsersArray[index];
}

#pragma mark -
#pragma mark ObservableObject Method Override

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case IDPModelArrayAddObject:
            return @selector(modelArrayAddObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
