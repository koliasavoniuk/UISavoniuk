//
//  IDPAppDelegate.m
//  UITask1
//
//  Created by Student002 on 6/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPAppDelegate.h"

#import "IDPSceneViewController.h"
#import "IDPUsersViewController.h"
#import "IDPUser.h"
#import "IDPUsersModel.h"
#import "UIWindow+IDPExtensions.h"

@interface IDPAppDelegate ()
@property (nonatomic, assign)   IDPUsersViewController  *viewController;

@end

@implementation IDPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow initWindowWithSize];
    self.window = window;
    
    //TASK 1
    
    //window.rootViewController = [IDPSceneViewController new];
     
    
    //TASK 2
    
    IDPUsersViewController *controller = [IDPUsersViewController new];
    IDPUsersModel *usersModel = [IDPUsersModel new];
    controller.usersModel = usersModel;
    [usersModel load];
    
    window.rootViewController = controller;
    self.viewController = controller;

    //TASK3

    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.viewController.usersModel save];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.viewController.usersModel save];
}


@end
