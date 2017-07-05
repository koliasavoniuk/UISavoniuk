//
//  IDPModelObserver.h
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IDPModelState) {
    IDPModelDidUnload,
    IDPModelWillLoad,
    IDPModelDidLoad,
    IDPModelDidFailLoading,
    IDPModelStateCount
};

@protocol IDPModelObserver <NSObject>

@optional
- (void)modelDidLoad:(id)object;
- (void)modelDidUnload:(id)object;
- (void)modelWillLoad:(id)object;
- (void)model:(id)model didFailLoadingWithError:(NSError *)error;

@end
