//
//  NSFileManager+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 6/30/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "NSFileManager+IDPExtensions.h"

@implementation NSFileManager (IDPExtensions)

#pragma mark -
#pragma mark Class Methods

+ (NSURL *)libraryFolderURL {
    static dispatch_once_t onceToken;
    static NSURL *url = nil;
    dispatch_once(&onceToken, ^{
        url = [self urlForDirectory:NSLibraryDirectory];
    });
    
    return url;
}
+ (NSURL *)documentsFolderURL {
    static dispatch_once_t onceToken;
    static NSURL *url = nil;
    dispatch_once(&onceToken, ^{
        url = [self urlForDirectory:NSDocumentDirectory];
    });
    
    return url;
}

+ (BOOL)fileExsitInDefaultManagerAtPath:(NSString *)path {
    return [[self defaultManager] fileExistsAtPath:path];
}

#pragma mark -
#pragma mark Public Methods

- (NSURL *)folderURLInLibraryWithName:(NSString *)name {
    static dispatch_once_t onceToken;
    static NSURL *url = nil;
    dispatch_once(&onceToken, ^{
        NSURL *libraryURL = [NSFileManager libraryFolderURL];
        NSError *error;
        NSString *filePath = [libraryURL.path stringByAppendingPathComponent:name];
        BOOL result = [[NSFileManager defaultManager] createDirectoryAtPath:filePath
                                                withIntermediateDirectories:YES
                                                                 attributes:nil
                                                                      error:&error];
        if (!result) {
            NSLog(@"Create directory error: %@", error);
        }
        
        url = [NSURL URLWithString:filePath];
    });
    
    return url;
}

#pragma mark -
#pragma mark Private

+ (NSURL *)urlForDirectory:(NSSearchPathDirectory)directory {
    NSString *url = [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) firstObject];
    return  [NSURL URLWithString:url];
}

@end
