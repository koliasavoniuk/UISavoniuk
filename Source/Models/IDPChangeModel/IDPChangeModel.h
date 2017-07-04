//
//  IDPChangeModel.h
//  UITask1
//
//  Created by Student002 on 6/23/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface IDPChangeModel : NSObject
@property (nonatomic, readonly) NSUInteger  index;

+ (instancetype)addArrayChangeWithIndex:(NSUInteger)index;
+ (instancetype)removeArrayChangeWithIndex:(NSUInteger)index;
+ (instancetype)moveArrayChangeWithSourceIndex:(NSUInteger)sourceIndex destinationIndex:(NSUInteger)destinationIndex;

- (instancetype)initWithIndex:(NSUInteger)index;

@end
