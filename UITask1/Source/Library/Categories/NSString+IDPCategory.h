//
//  NSString+IDPCategory.h
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IDPCategory)

+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)capitalizedLetterAlphabet;
+ (instancetype)letterAlphabet;
+ (instancetype)alphanumericAlphabet;
+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;

// Returns string with english alphanumeric characters with random length(up to 30) with the class receiver
+ (instancetype)randomString;

// Returns string with english alphanumeric characters with length
+ (instancetype)randomStringWithLength:(NSUInteger)length;

// Returns string with characters from alphabet with length
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
