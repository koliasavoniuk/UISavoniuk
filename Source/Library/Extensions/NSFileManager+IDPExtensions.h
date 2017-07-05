//
//  NSFileManager+IDPExtensions.h
//  UITask1
//
//  Created by Student002 on 6/30/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (IDPExtensions)

+ (NSURL *)libraryFolderURL;
+ (NSURL *)documentsFolderURL;

+ (BOOL)fileExsitInDefaultManagerAtPath:(NSString *)path;

- (NSURL *)folderURLInLibraryWithName:(NSString *)name;

@end
