//
//  IDPLoadingView.m
//  UITask1
//
//  Created by Student002 on 6/28/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPLoadingView.h"

#import "IDPConstants.h"
#import "UINib+IDPExtensions.h"

@implementation IDPLoadingView

@synthesize loading = _loading;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingViewInSuperview:(UIView *)superview {
    return [[self alloc] initFromNibWithSuperview:superview];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initFromNibWithSuperview:(UIView *)superView {
    IDPLoadingView *loadingView = [UINib objectWithClass:[self class]];
    loadingView.frame = superView.bounds;
    [superView addSubview:loadingView];
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
                                    | UIViewAutoresizingFlexibleLeftMargin
                                    | UIViewAutoresizingFlexibleBottomMargin
                                    | UIViewAutoresizingFlexibleRightMargin;
    
    return loadingView;
}

#pragma mark -
#pragma mark Accessors

- (void)setLoading:(BOOL)loading {
    [self setLoading:loading animations:nil];
}

#pragma mark -
#pragma mark LoadingViewProtocol

- (void)setLoading:(BOOL)loading
        animations:(void (^ _Nullable)(void))animations
{
    [self setLoading:loading animations:animations completionHandler:nil];
}

- (void)setLoading:(BOOL)loading
        animations:(void (^ _Nullable)(void))animations
 completionHandler:(void (^ _Nullable)(BOOL))completion
{
    _loading = loading;
    
    [UIView animateWithDuration:kIDPAnimationDuration
                     animations:animations
                     completion:completion];
}

@end
