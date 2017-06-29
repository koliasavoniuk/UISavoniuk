//
//  IDPUsersModelObserver.h
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IDPModelState) {
    IDPModelDidLoad,
    IDPModelDidUnload,
    IDPModelDidFailLoading,
    IDPModelDidChange,
    IDPModelWillLoad,
};

@protocol IDPUsersModelObserver <NSObject>

@optional
- (void)modelDidLoad:(id)object;
- (void)modelDidUnload:(id)object;
- (void)modelDidFailLoading:(id)object;
- (void)modelDidChange:(id)object;
- (void)modelWillLoad:(id)object;

@end
