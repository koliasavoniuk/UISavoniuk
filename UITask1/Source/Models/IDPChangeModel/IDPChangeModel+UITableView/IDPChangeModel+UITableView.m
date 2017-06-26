//
//  IDPChangeModel+UITableView.m
//  UITask1
//
//  Created by Student002 on 6/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPChangeModel+UITableView.h"

#import "IDPChangeAdd.h"
#import "IDPChangeRemove.h"

#import "UITableView+IDPExtensions.h"

@implementation IDPChangeModel (UITableView)

- (void)applyToTableView:(UITableView *)table {
    [self applyToTableView:table section:0];
}

- (void)applyToTableView:(UITableView *)table section:(NSUInteger)section {
    [self applyToTableView:table section:section animation:UITableViewRowAnimationAutomatic];
}

- (void)applyToTableView:(UITableView *)table section:(NSUInteger)section animation:(UITableViewRowAnimation)animation {

}

@end

@implementation IDPChangeAdd (UITableView)

#pragma mark -
#pragma mark Overriding methods

- (void)applyToTableView:(UITableView *)table section:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:section];
    
    [table updateWithBlock:^{
        [table insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
}

@end

@implementation IDPChangeRemove (UITableView)

#pragma mark -
#pragma mark Overriding methods

- (void)applyToTableView:(UITableView *)table section:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:section];
    
    [table updateWithBlock:^{
        [table deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
}

@end
