//
//  UIWindow+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 6/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "UIWindow+IDPExtensions.h"

@implementation UIWindow (IDPExtensions)

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
