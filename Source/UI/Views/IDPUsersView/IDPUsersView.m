//
//  IDPUsersView.m
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUsersView.h"

#import "IDPUsersModel.h"
#import "IDPLoadingView.h"

@implementation IDPUsersView

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    if (_editing == editing) {
        return;
    }
    
    if (editing) {
        [self.tableView setEditing:!self.tableView.editing animated:YES];
    }
}

#pragma mark -
#pragma mark Private Methods

- (UIView<IDPLoading> *)defaultLoadingView {
    return [IDPLoadingView loadingViewInSuperview:self];
}

@end
