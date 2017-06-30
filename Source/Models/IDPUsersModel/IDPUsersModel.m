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

@interface IDPUsersModel()
@property (nonatomic, strong)   NSURL   *url;

- (NSURL *)applicationDocumentsDirectory;

@end

@implementation IDPUsersModel

#pragma mark -
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    self.url = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:kIDPFileName];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.objectsArray toFile:self.url.path];
}

- (void)loadMethods {
    IDPDispatchAsyncInBackground(^{
        NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:self.url.path];

        [self performBlock:^{
            [self addObjects:array];
        } shouldNotify:YES];
        
        IDPDispatchSyncOnMainQueue(^{
            self.state = IDPModelDidLoad;
        });
    });
}

#pragma mark -
#pragma mark Private

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
