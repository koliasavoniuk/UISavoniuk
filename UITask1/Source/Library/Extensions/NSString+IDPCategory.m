//
//  NSString+IDPCategory.m
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

#import "IDPRandom.h"
#import "NSString+IDPCategory.h"

static
NSUInteger kIDPStringLengthDefault = 30;

static
NSRange IDPMakeAlphabetRange(unichar firstChar, unichar lastChar) {
    unichar minValue = MIN(firstChar, lastChar);
    unichar maxValue = MAX(firstChar, lastChar);
    
    return NSMakeRange(minValue, maxValue - minValue + 1);
}

@implementation NSString (IDPCategory)

+ (instancetype)numericAlphabet {
    return [self alphabetWithUnicodeRange:IDPMakeAlphabetRange('0', '9')];
}

+ (instancetype)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:IDPMakeAlphabetRange('a', 'z')];
}

+ (instancetype)capitalizedLetterAlphabet {
    return [self alphabetWithUnicodeRange:IDPMakeAlphabetRange('A', 'Z')];
}

+ (instancetype)letterAlphabet {
    NSString *result = [self lowercaseLetterAlphabet];
    result = [result stringByAppendingString:[self capitalizedLetterAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)alphanumericAlphabet {
    NSString *result = [self letterAlphabet];
    result = [result stringByAppendingString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)randomString {
    return [self randomStringWithLength:IDPRandomTillNumber(kIDPStringLengthDefault)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = alphabet.length;
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar resultChar = [alphabet characterAtIndex:IDPRandomTillNumber(alphabetLength - 1)];
        [result appendFormat:@"%c", resultChar];
    }
    
    return [self stringWithString:result];
}

@end
