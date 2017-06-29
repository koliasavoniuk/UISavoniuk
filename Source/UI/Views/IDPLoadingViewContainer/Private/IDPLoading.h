//
//  IDPLoading.h
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IDPLoading <NSObject>
@property (nonatomic, assign, getter=isLoading) BOOL    loading;

- (void)setLoading:(BOOL)loading
        animations:(void (^_Nullable)(void))animations;

- (void)setLoading:(BOOL)loading
        animations:(void (^_Nullable)(void))animations
 completionHandler:(void (^_Nullable)(BOOL))completion;

@end
