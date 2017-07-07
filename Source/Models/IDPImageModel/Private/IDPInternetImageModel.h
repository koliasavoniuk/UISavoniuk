//
//  IDPInternetImageModel.h
//  UITask1
//
//  Created by Student002 on 7/4/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPFileSystemImageModel.h"

@interface IDPInternetImageModel : IDPFileSystemImageModel
@property (nonatomic, readonly)     NSURL        *localPath;

@end
