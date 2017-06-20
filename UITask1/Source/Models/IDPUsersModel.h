//
//  IDPUsersModel.h
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPObservableObject.h"
#import "IDPUsersModelObserver.h"

@interface IDPUsersModel : IDPObservableObject<IDPUsersModelObserver>
@property (nonatomic, strong, readonly) NSArray *usersArray;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;

- (void)addObjects:(NSArray *)objects;
- (void)removeObjects:(NSArray *)objects;

- (NSUInteger)usersArrayCount;

- (void)exchangeUserAtIndex:(NSUInteger)firstIndex withUserAtIndex:(NSUInteger)secondIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
