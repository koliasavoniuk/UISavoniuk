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
#pragma mark Private

- (instancetype)createUsers:(NSUInteger)count {
    self.mutableUsersArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [self.mutableUsersArray addObject:[IDPUser new]];
    }
    
    return self;
}

#pragma mark -
#pragma mark ObservableObject Method Override

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case IDPModelDidLoad:
            return @selector(modelArrayAddObject:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
