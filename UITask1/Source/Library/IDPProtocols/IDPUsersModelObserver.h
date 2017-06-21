//
//  IDPUsersModelObserver.h
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IDPUsersModelState) {
    IDPModelArrayAddObject,
};

@protocol IDPUsersModelObserver <NSObject>

@optional
- (void)modelArrayAddObject:(id)object;

@end
