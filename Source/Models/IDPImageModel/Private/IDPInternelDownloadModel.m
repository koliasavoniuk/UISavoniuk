//
//  IDPInternelDownloadModel.m
//  UITask1
//
//  Created by Student002 on 7/5/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPInternelDownloadModel.h"

@implementation IDPInternelDownloadModel

#pragma mark -
#pragma mark ObservableObject Method Override

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case IDPModelDidFailLoadingWithError:
            return @selector(model:didFailDownloadingWithError:);
            
        default:
            return [super selectorForState:state];
    }
}


@end
