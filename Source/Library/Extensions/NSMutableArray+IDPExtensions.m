//
//  NSMutableArray+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 7/4/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "NSMutableArray+IDPExtensions.h"

@implementation NSMutableArray (IDPExtensions)

- (void)removeObjectByIndex:(NSUInteger)sourceIndex insertNewByIndex:(NSUInteger)destinationIndex inArray:(NSMutableArray *)array {
    
    id object = [array objectAtIndex:sourceIndex];
    [array removeObject:array[sourceIndex]];
    [array insertObject:object atIndex:destinationIndex];
    
}

@end
