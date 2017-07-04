//
//  IDPMacro.h
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#define IDPDefineBaseViewProperty(propertyName, viewClass) \
    @property (nonatomic, readonly) viewClass   *propertyName;

#define IDPBaseViewGetterSynthesize(selector, viewClass) \
- (viewClass *)selector { \
    if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
        return (viewClass *)self.view; \
    } \
    \
    return nil; \
}

#define IDPViewControllerBaseViewProperty(viewControllerClass, propertyName, baseViewClass) \
    @interface viewControllerClass (__IDPPrivateBaseView) \
    IDPDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation viewControllerClass (__IDPPrivateBaseView) \
    \
    @dynamic propertyName; \
    \
    IDPBaseViewGetterSynthesize(propertyName, baseViewClass); \
    \
    @end \

#define IDPWeakify(variable) \
__weak __typeof(variable) __IDPWeakified_##variable = variable

// you should only call this method after you called wekify for that same variable
#define IDPStrongify(variable) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"");\
__strong __typeof(variable) variable = __IDPWeakified_##variable \
_Pragma("clang diagnostic pop");

#define IDPEmptyResult

#define IDPStrongifyAndReturnIfNil(variable) \
    IDPStrongifyAndReturnResultIfNil(variable, IDPEmptyResult)

#define IDPStrongifyAndReturnNilIfNil(variable) \
    IDPStrongifyAndReturnResultIfNil(variable, nil)

#define IDPStrongifyAndReturnResultIfNil(variable, result) \
    IDPStrongify(variable); \
    if (!variable) { \
        return result; \
    }
