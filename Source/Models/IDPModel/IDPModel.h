//
//  IDPModel.h
//  UITask1
//
//  Created by Student002 on 6/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPObservableObject.h"

#import "IDPUsersModelObserver.h"

@interface IDPModel : IDPObservableObject<IDPUsersModelObserver>

- (void)save;
- (void)load;

//This method is creating for subclasses don't call it directly
- (void)loadMethods;

@end
