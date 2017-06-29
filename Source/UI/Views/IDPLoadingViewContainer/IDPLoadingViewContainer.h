//
//  IDPLoadingViewContainer.h
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IDPLoading.h"

@interface IDPLoadingViewContainer : UIView
@property (nonatomic, assign, getter=isAnimatedLoading) BOOL    animatedLoading;

@property (nonatomic, strong)   IBOutlet    UIView<IDPLoading>  *loadingView;

@end
