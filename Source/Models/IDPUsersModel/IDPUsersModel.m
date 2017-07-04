//
//  IDPUsersModel.m
//  UITask1
//
//  Created by Student002 on 6/20/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUsersModel.h"

#import "IDPUser.h"
#import "IDPConstants.h"
#import "IDPGCDWrapper.h"
#import "NSFileManager+IDPExtensions.h"

@interface IDPUsersModel()
@property (nonatomic, strong)   NSURL   *url;

@end

@implementation IDPUsersModel

#pragma mark -
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    self.url = [[NSFileManager applicationDocumentsDirectoryURL] URLByAppendingPathComponent:kIDPFileName];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.objectsArray toFile:self.url.path];
}

- (void)performLoading {
    IDPDispatchAsyncInBackground(^{
        NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:self.url.path];
        
        [self performBlockWithoutNotifications:^{
           [self addObjects:array];
        }];
        
        IDPDispatchSyncOnMainQueue(^{
            self.state = IDPModelDidLoad;
        });
    });
}

@end
