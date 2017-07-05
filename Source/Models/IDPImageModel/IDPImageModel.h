//
//  IDPImageModel.h
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDPModel.h"

#import "IDPModel.h"
#import "IDPModelObserver.h"
#import "IDPCache.h"

@interface IDPImageModel : IDPModel<IDPModelObserver>
@property (nonatomic, readonly) UIImage     *image;
@property (nonatomic, readonly) NSURL       *url;
@property (nonatomic, readonly) IDPCache    *cache;

+ (instancetype)modelWithURL:(NSURL *)url;

// This method is for overriding in subclasses. Do not call it directly.
- (void)loadWithCompletion:(void (^)(UIImage *, id))block;
- (instancetype)initWithURL:(NSURL *)url;

@end
