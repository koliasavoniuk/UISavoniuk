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
#pragma mark Classes

+ (NSURL *)applicationDocumentsDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)applicationLibraryDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)applicationLibraryDirectoryWithName:(NSString *)name {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [self applicationDocumentsDirectoryURL].path;
    NSString *namePath = [documentsPath stringByAppendingPathComponent:name];
    if (![fileManager fileExistsAtPath:namePath]) {
        if ([fileManager createDirectoryAtPath:namePath withIntermediateDirectories:NO attributes:nil error:nil]) {
            return [NSURL fileURLWithPath:namePath];
        }
    }
    
    return nil;
}

@end
