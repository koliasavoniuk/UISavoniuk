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
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.loadingView = [self defaultLoadingView];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    self.loadingView = [self defaultLoadingView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        [self defaultLoadingView];
    }
}

#pragma mark -
#pragma mark Private Methods

- (UIView<IDPLoading> *)defaultLoadingView {
    return [IDPLoadingView loadingViewInSuperview:self];
}

@end
