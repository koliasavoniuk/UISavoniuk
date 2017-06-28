//
//  IDPChangeMove.h
//  UITask1
//
//  Created by Student002 on 6/27/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPChangeModel.h"

@interface IDPChangeMove : IDPChangeModel
@property (nonatomic, readonly) NSUInteger  destinationIndex;

- (instancetype)initMoveArrayChangeWithSourceIndex:(NSUInteger)sourceIndex destinationIndex:(NSUInteger)destinationIndex;

@end