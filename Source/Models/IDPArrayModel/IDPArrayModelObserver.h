//
//  IDPArrayModelObserver.h
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPUsersModelObserver.h"

typedef NS_ENUM (NSUInteger, IDPArrayModelState) {
    IDPArrayModelDidChange = IDPModelStateCount
};

@protocol IDPArrayObserver <IDPUsersModelObserver>

@optional
- (void)model:(id)model didChangeWithObject:(id)object;

@end
