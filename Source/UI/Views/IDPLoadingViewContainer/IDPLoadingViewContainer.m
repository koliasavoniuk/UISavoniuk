//
//  IDPLoadingViewContainer.m
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPLoadingViewContainer.h"

#import "IDPLoadingView.h"
#import "IDPMacro.h"
#import "IDPConstants.h"

@interface IDPLoadingViewContainer ()

- (UIView<IDPLoading> *)defaultLoadingView;

- (void)showLoading;
- (void)hideLoading;

- (void)setLoading:(BOOL)loading withAlpha:(NSUInteger)alpha;

@end

@implementation IDPLoadingViewContainer

@synthesize animatedLoading = _animatedLoading;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.loadingView = [self defaultLoadingView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        self.loadingView = [self defaultLoadingView];
    }
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isAnimatedLoading {
    return self.loadingView.isLoading;
}

- (void)setAnimatedLoading:(BOOL)animatedLoading {
    if (_animatedLoading != animatedLoading) {
        
        _animatedLoading = animatedLoading;
        
    }
    
    if (animatedLoading) {
        [self bringSubviewToFront:self.loadingView];
        [self showLoading];
    } else {
        [self hideLoading];
    }
}

- (void)setLoadingView:(UIView<IDPLoading> *)loadingView {
    if (_loadingView != loadingView) {
        [_loadingView removeFromSuperview];
        
        _loadingView = loadingView;
        
        [self addSubview:_loadingView];
    }
}

#pragma mark -
#pragma mark Private Methods

- (UIView<IDPLoading> *)defaultLoadingView {
    return [IDPLoadingView loadingViewInSuperview:self];
}

- (void)showLoading {
    [self setLoading:YES withAlpha:kIDPShowAlpha];
}

- (void)hideLoading {
    [self setLoading:NO withAlpha:kIDPHideAlpha];
}

- (void)setLoading:(BOOL)loading withAlpha:(NSUInteger)alpha {
    IDPWeakify(self);
    [self.loadingView setLoading:loading animations:^{
        IDPStrongifyAndReturnIfNil(self);
        self.loadingView.alpha = alpha;
    }];
}

@end
