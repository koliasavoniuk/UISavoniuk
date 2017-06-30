//
//  IDPModel.m
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPModel.h"

@implementation IDPModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        if (IDPModelWillLoad == self.state) {
            [self notifyOfState:IDPModelWillLoad];
            return;
        }
        
        if (IDPModelDidLoad == self.state) {
            [self notifyOfState:IDPModelDidLoad];
            return;
        }
        
        self.state = IDPModelWillLoad;
        
        [self loadMethods];
    }
}

- (void)loadMethods {

}

#pragma mark -
#pragma mark ObservableObject Method Override

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case IDPModelDidLoad:
            return @selector(modelDidLoad:);
            
        case IDPModelWillLoad:
            return @selector(modelWillLoad:);
            
        case IDPModelDidUnload:
            return @selector(modelDidUnload:);
            
        case IDPModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
