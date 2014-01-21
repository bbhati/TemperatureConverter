//
//  ConversionHelper.m
//  TemperatureConverter
//
//  Created by Chix on 1/17/14.
//  Copyright (c) 2014 Bhagyashree. All rights reserved.
//

#import "ConversionHelper.h"

@implementation ConversionHelper

+(float) convertFahrenHeitToCelsius:(float) tempInFahrenheit {
    return ((tempInFahrenheit -32)*5)/9;
    
}

+(float) convertCelsiusToFahrenheit:(float) tempInCelsius {
    return (tempInCelsius *9)/5 + 32;
}

+(NSString*) truncateTrailingZeros:(NSString*) input {
    NSString* result = input;
    NSRange range = [input rangeOfString:@"."];
    if(range.location > 0) {
        NSArray* splitByDecimal = [input componentsSeparatedByString:@"."];
        NSString* firstPart = splitByDecimal[0];
        NSString* secondPart = splitByDecimal[1];
        int index = (int)[secondPart length] - 1;
        while(index >= 0 && [secondPart characterAtIndex:index] == '0'){
            index --;
        }
        if(index == -1) {
            result = firstPart;
        } else if(index != (int)[secondPart length] - 1){
            //truncate
            secondPart = [secondPart substringToIndex:index+1];
            NSArray* newParts = [NSArray arrayWithObjects:firstPart, secondPart, nil];
            result = [newParts componentsJoinedByString:@"."];
        }
    }
    return result;
}
@end
