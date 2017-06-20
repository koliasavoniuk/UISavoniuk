//
//  IDPImageModel.h
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDPImageModel : NSObject
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

@property (nonatomic, readonly, getter=isLoaded)        BOOL loaded;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)load;
- (void)dump;
@end
