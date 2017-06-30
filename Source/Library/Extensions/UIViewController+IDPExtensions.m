//
//  UIViewController+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 6/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "UIViewController+IDPExtensions.h"

@implementation UIViewController (IDPExtensions)

+ (instancetype)viewController {
    NSString *viewControllerClass = NSStringFromClass([self class]);
    NSString *nibName = [self nibName];
    if (nibName == nil) {
        nibName = viewControllerClass;
    }
    
    return [[self alloc] initWithNibName:nibName bundle:nil];
}

+ (NSString *)nibName {
    return nil;
}

@end
