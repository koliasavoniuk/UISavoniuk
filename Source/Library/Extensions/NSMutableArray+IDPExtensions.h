//
//  NSMutableArray+IDPExtensions.h
//  UITask1
//
//  Created by Student002 on 7/4/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (IDPExtensions)

- (void)removeObjectByIndex:(NSUInteger)index insertNewByIndex:(NSUInteger)destinationIndex inArray:(NSMutableArray *)array;

@end
