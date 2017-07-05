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

+ (instancetype)localURLFromNetworkURL:(NSURL *)url {
    NSString *fileName = [[url lastPathComponent] stringByDeletingPathExtension];
    
    NSURL *localUrl = [NSURL fileURLWithPath:
                       [NSString stringWithFormat:
                        @"%@/%@", [NSFileManager libraryFolderURL].path, fileName]];
    
    return localUrl;
}


@end
