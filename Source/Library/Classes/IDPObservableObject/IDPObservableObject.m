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
@property (nonatomic, strong)   NSHashTable *mutableObservers;
@property (nonatomic, assign)   BOOL        shouldNotify;

@end

@implementation IDPObservableObject

@dynamic observers;

@synthesize state = _state;

#pragma mark -
#pragma mark Deallocations and initializations

- (instancetype)init {
    self = [super init];
    self.mutableObservers = [NSHashTable weakObjectsHashTable];
    self.shouldNotify = YES;
    
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
        if (_state != state) {
            _state = state;
        }
        
        if (self.shouldNotify) {
            [self notifyOfState:state];
        }
    }
}

- (NSUInteger)state {
    return _state;
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
    [self notifyOfState:state withObject:nil];
}

- (void)notifyOfState:(NSUInteger)state withObject:(id)object {
    if (self.shouldNotify) {
        [self notifyOfStateWithSelector:[self selectorForState:state]
                             withObject:object];
    }
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    _state = state;
    
    [self notifyOfState:state withObject:object];
}

- (void)performBlock:(void(^)())block shouldNotify:(BOOL)shouldNotify {
    BOOL blockNotify = self.shouldNotify;
    self.shouldNotify = shouldNotify;
    block();
    self.shouldNotify = blockNotify;
}

#pragma mark -
#pragma mark Private

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void)notifyOfStateWithSelector:(SEL)selector withObject:(id)object {
    @synchronized (self) {
        NSSet *observers = self.observers;
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector
                               withObject:self
                               withObject:object];
            }
        }
    }
}

#pragma clang diagnostic pop

@end
