//
//  IDPFileSystemImageModel.m
//  UITask1
//
//  Created by Student002 on 7/4/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPFileSystemImageModel.h"

#import "NSFileManager+IDPExtensions.h"
#import "IDPGCDWrapper.h"

@implementation IDPFileSystemImageModel


#pragma mark -
#pragma mark Public Methods

- (void)loadWithCompletion:(void (^)(UIImage *, id))block {
    block([UIImage imageWithContentsOfFile:self.url.path], nil);
}

@end
