//
//  IDPLoadingView.h
//  UITask1
//
//  Created by Student002 on 6/28/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IDPLoading.h"

@interface IDPLoadingView : UIView<IDPLoading>
@property (nonatomic, strong)   IBOutlet    UIActivityIndicatorView *activityIndicatorView;

+ (instancetype)loadingViewInSuperview:(UIView *)superview;

@end
