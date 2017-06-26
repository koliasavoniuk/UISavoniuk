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
#pragma mark Private

- (instancetype)createUsers:(NSUInteger)usersCount {
    for (NSUInteger i = 0; i < usersCount; i++) {
        [self addObject:[IDPUser new]];
    }
    
    return self;
}

#pragma mark -
#pragma mark ObservableObject Method Override

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case IDPModelDidChange:
            return @selector(model:didChangeWithObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
