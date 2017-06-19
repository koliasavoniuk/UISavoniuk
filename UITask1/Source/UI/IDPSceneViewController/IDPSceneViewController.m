//
//  IDPSceneViewController.m
//  UITask1
//
//  Created by Student002 on 6/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPSceneViewController.h"

#import "IDPSceneView.h"

#import "IDPMacro.h"

IDPViewControllerBaseViewProperty(IDPSceneViewController, sceneView, IDPSceneView)

@implementation IDPSceneViewController

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onMoveButton:(id)sender {
    [self.sceneView changeButtonTitle];
    self.sceneView.squareView.moving = !self.sceneView.squareView.moving;
}

- (IBAction)onMoveNextPositionButton:(id)sender {
    [self.sceneView.squareView moveToNextPosition];
}
@end
