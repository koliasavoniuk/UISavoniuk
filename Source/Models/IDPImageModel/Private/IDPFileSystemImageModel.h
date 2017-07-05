//
//  IDPFileSystemImageModel.h
//  UITask1
//
//  Created by Student002 on 7/4/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPImageModel.h"

@interface IDPFileSystemImageModel : IDPImageModel
@property (nonatomic, copy) NSString    *imagePath;

- (void)takeImageFromCache;

@end
