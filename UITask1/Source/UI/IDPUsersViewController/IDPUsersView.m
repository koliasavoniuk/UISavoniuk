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
    self.loadingView = [IDPLoadingView loadingViewFromNibWithSuperView:self];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    self.loadingView = [IDPLoadingView loadingViewFromNibWithSuperView:self];
    
    return self;
}

#pragma mark -
#pragma mark UIView Methods Override

- (void)layoutSubviews {
    [super layoutSubviews];
    IDPLoadingView *loadingView = self.loadingView;
    loadingView.frame = self.bounds;
    loadingView.indicatorView.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.height / 2);
}

@end
