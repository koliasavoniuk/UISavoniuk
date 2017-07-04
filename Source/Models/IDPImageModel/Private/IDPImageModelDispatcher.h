//
//  IDPImageModelDispatcher.h
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDPImageModelDispatcher : NSObject
@property (nonatomic, readonly) NSOperationQueue    *queue;

+(instancetype)sharedDispatcher;

@end