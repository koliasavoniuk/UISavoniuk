//
//  UITableView+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 6/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "UITableView+IDPExtensions.h"

#import "UINib+IDPExtensions.m"

@implementation UITableView (IDPExtensions)

- (id)reusableCellWithClass:(Class)class {
    NSString *cellClass = NSStringFromClass(class);
    
    return [self dequeueReusableCellWithIdentifier:cellClass];
}

- (id)reusableCellWithClassOrCreateNew:(Class)class {
    UITableView *cell = [self reusableCellWithClass:class];
    
    if (!cell) {
        UINib *nib = [UINib nibWithClass:class];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    return cell;
}

- (void)updateWithBlock:(void(^)())block {
    [self beginUpdates];
    block();
    [self endUpdates];
}

@end
