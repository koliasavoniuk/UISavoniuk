//
//  NSURL+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 7/5/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "NSURL+IDPExtensions.h"

#import "NSFileManager+IDPExtensions.h"

@implementation NSURL (IDPExtensions)

- (instancetype)localURLFromNetworkURL {
    NSString *fileNameEncoding = [self.relativePath
                                  stringByAddingPercentEncodingWithAllowedCharacters:
                                  [NSCharacterSet alphanumericCharacterSet]];
    
    NSURL *localUrl = [NSURL fileURLWithPath:
                       [NSString stringWithFormat:
                        @"%@/%@", [NSFileManager libraryFolderURL].path, fileNameEncoding]];
    
    return localUrl;
}

@end
