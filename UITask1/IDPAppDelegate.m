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
#import "UIWindow+IDPExtensions.h"

@interface IDPAppDelegate ()

@end

@implementation IDPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow initWindowWithSize];
    self.window = window;
    
    //TASK 1
    /*
    window.rootViewController = [IDPSceneViewController new];
     */
    
    //TASK 2
    
    IDPUsersViewController *controller = [IDPUsersViewController new];
    controller.usersModel = [IDPUsersModel new];
    window.rootViewController = controller;
    
    //TASK3

    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
