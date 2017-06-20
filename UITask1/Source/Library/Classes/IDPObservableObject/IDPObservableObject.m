//
//  IDPObservableObject.m
//  Objc Task7
//
//  Created by Student002 on 5/29/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPObservableObject.h"

#pragma mark -
#pragma mark Private declarations

@interface IDPObservableObject ()
@property (nonatomic, strong) NSHashTable *mutableObservers;

@end

@implementation IDPObservableObject

@dynamic observers;

#pragma mark -
#pragma mark Deallocations and initializations

- (instancetype)init {
    self = [super init];
    self.mutableObservers = [NSHashTable weakObjectsHashTable];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observers {
    @synchronized (self) {
        return [self.mutableObservers copy];
    }
}

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (_state == state) {
            return;
        }
        
        _state = state;
        
        [self notifyOfState:state];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    if (!observer) {
        return;
    }
    
    @synchronized (self) {
        [self.mutableObservers addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    if (!observer) {
        return;
    }
    
    @synchronized (self) {
        [self.mutableObservers removeObject:observer];
    }
}

- (void)addObservers:(NSArray *)observers {
    for (id observer in observers) {
        [self addObserver:observer];
    }
}

- (void)removeObservers:(NSArray *)observers {
    for (id observer in observers) {
        [self removeObserver:observer];
    }
}

// should be overriden in subclasses
- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)notifyOfState:(NSUInteger)state {
    [self notifyOfStateWithSelector:[self selectorForState:state]];
}

#pragma mark -
#pragma mark Private

- (void)notifyOfStateWithSelector:(SEL)selector {
    @synchronized (self) {
        NSSet *observers = self.observers;
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self];
            }
        }
    }
}

@end
