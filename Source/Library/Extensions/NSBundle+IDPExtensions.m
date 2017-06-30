//
//  NSBundle+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 6/30/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "NSBundle+IDPExtensions.h"

#import "NSArray+IDPExtensions.h"
#import <UIKit/UIKit.h>

@implementation NSBundle (IDPExtensions)

- (id)objectWithClass:(Class)class {
    return [self objectWithClass:class owner:nil];
}

- (id)objectWithClass:(Class)class owner:(id)owner {
    return [self objectWithClass:class owner:owner option:nil];
}

- (id)objectWithClass:(Class)class owner:(id)owner option:(NSDictionary *)option {
    NSArray *objects = [self loadNibNamed:NSStringFromClass(class) owner:owner options:option];
    
    return [objects objectWithClass:class];
}

@end
