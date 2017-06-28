//
//  IDPLoadingView.h
//  UITask1
//
//  Created by Student002 on 6/28/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDPLoadingView : UIView
@property (nonatomic, strong)   IBOutlet    UIActivityIndicatorView *indicatorView;

+ (instancetype)loadingViewFromNibWithSuperview:(UIView *)superView;

- (instancetype)initFromNibWithSuperview:(UIView *)superView;

- (void)showLoading;
- (void)hideLoading;

@end