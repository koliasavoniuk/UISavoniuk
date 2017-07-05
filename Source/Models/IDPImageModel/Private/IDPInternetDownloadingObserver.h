//
//  IDPInternetDownloadingObserver.h
//  UITask1
//
//  Created by Student002 on 7/5/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IDPInternetDownloadingObserver <NSObject>

@optional
- (void)model:(id)model didFailDownloadingWithError:(NSError *)error;

@end
