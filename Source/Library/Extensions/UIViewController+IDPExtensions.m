//
//  UIViewController+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 6/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "UIViewController+IDPExtensions.h"

@implementation UIViewController (IDPExtensions)

- (instancetype)createViewControllerWithDefaultNib:(Class)class {
    NSString *defaultNib = NSStringFromClass(class);
    
    return [[class alloc] initWithNibName:defaultNib bundle:nil];
}

@end
