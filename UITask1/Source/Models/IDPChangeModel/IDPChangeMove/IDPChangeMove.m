//
//  IDPChangeMove.m
//  UITask1
//
//  Created by Student002 on 6/27/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPChangeMove.h"

#import "IDPChangeModel+UITableView.h"
#import "IDPChangeModelProtected.h"

@interface IDPChangeMove ()
@property (nonatomic, assign) NSUInteger  destinationIndex;

@end

@implementation IDPChangeMove

- (instancetype)initMoveArrayChangeWithSourceIndex:(NSUInteger)sourceIndex destinationIndex:(NSUInteger)destinationIndex {
    self = [super init];
    self.index = sourceIndex;
    self.destinationIndex = destinationIndex;
    
    return self;
}

@end
