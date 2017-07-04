//
//  IDPArrayModelObserver.h
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPModelObserver.h"

typedef NS_ENUM (NSUInteger, IDPArrayModelState) {
    IDPArrayModelDidChange = IDPModelStateCount
};

@protocol IDPArrayObserver <IDPModelObserver>

@optional
- (void)model:(id)model didChangeWithObject:(id)object;

@end
