//
//  IDPGCDWrap.h
//  Objc Task7
//
//  Created by Student002 on 6/9/17.
//  Copyright © 2017 Student002. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef void(^IDPBlock)();
typedef BOOL(^IDPRunBlock)();

extern void IDPDispatchOnMainQueue(IDPBlock block);

// dipatch async queue on time interval
extern void IDPDispatchAsyncInBackgroundWithInterval(NSTimeInterval interval,
                                                     IDPBlock block,
                                                     IDPRunBlock running);

// dispatch asynchronous queues
extern void IDPDispatchAsyncInBackground(IDPBlock block);
extern void IDPDispatchAsyncWithUtilityPriority(IDPBlock block);
extern void IDPDispatchAsyncWithInitiatedPriority(IDPBlock block);
extern void IDPDispatchAsyncWithInteractivePriority(IDPBlock block);
extern void IDPDispatchAsyncWithDefaultPriority(IDPBlock block);

// dispatch synchronous queues
extern void IDPDispatchSyncOnMainQueue(IDPBlock block);
extern void IDPDispatchSyncInBackground(IDPBlock block);
extern void IDPDispatchSyncWithUtilityPriority(IDPBlock block);
extern void IDPDispatchSyncWithInitiatedPriority(IDPBlock block);
extern void IDPDispatchSyncWithInteractivePriority(IDPBlock block);
extern void IDPDispatchSyncWithDefaultPriority(IDPBlock block);
