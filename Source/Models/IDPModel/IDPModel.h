//
//  IDPModel.h
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPObservableObject.h"

#import "IDPModelObserver.h"

@interface IDPModel : IDPObservableObject

- (void)load;

//This method is creating for subclasses don't call it directly
- (void)performLoading;

@end
