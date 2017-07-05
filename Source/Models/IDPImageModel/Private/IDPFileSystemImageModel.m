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
#pragma mark Accessors

- (NSString *)imagePath {
    NSString *fileName = [[self.url lastPathComponent] stringByDeletingPathExtension];
    
    return [NSString stringWithFormat:@"%@/%@", [NSFileManager libraryFolderURL].path, fileName];
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoading {
    [self takeImageFromCache];
}

- (void)takeImageFromCache {
    NSData *data = [NSData dataWithContentsOfFile:self.imagePath];
    IDPDispatchAsyncOnMainQueue(^{
        self.image = [UIImage imageWithData:data];
    });
}

@end
