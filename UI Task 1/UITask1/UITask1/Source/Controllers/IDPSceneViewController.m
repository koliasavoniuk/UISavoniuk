//
//  IDPSceneViewController.m
//  UITask1
//
//  Created by Student002 on 6/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPSceneViewController.h"

#import "IDPSceneView.h"

@interface IDPSceneViewController ()
@property (nonatomic, readonly) IDPSceneView    *labelView;


@end

@implementation IDPSceneViewController

#pragma mark -
#pragma mark Accessors

- (IDPSceneView *)labelView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[IDPSceneView class]]) {
        return (IDPSceneView *)self.view;
    }
    
    return nil;
}

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
    [self.labelView.squareView moveSquare];
}
@end
