//
//  IDPLoadingView.m
//  UITask1
//
//  Created by Student002 on 6/28/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPLoadingView.h"

#import "UINib+IDPExtensions.h"

@implementation IDPLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingViewFromNibWithSuperview:(UIView *)superView {
    return [[self alloc] initFromNibWithSuperview:superView];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initFromNibWithSuperview:(UIView *)superView {
    IDPLoadingView *loadingView = [UINib objectWithClass:[self class]];
    loadingView.frame = superView.bounds;
    [superView addSubview:loadingView];
    
    return loadingView;
}

#pragma mark -
#pragma mark Public

- (void)showLoading {
    [self.indicatorView startAnimating];
}

- (void)hideLoading {
    [self.indicatorView stopAnimating];
    self.hidden = YES;
    [UIView animateWithDuration:1.5 animations:^{
        self.frame = CGRectMake(0, 0, 0, 0);
    }];
}

@end
