//
//  ConversionHelper.h
//  TemperatureConverter
//
//  Created by Chix on 1/17/14.
//  Copyright (c) 2014 Bhagyashree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConversionHelper : NSObject

+(float) convertFahrenHeitToCelsius:(float) tempInFahrenheit;
+(float) convertCelsiusToFahrenheit:(float) tempInCelsius;
+(NSString*) truncateTrailingZeros:(NSString*) input;

@end
