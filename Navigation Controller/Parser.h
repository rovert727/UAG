//
//  Parser.h
//  CM-JsonObject
//
//  Created by Walter Gonzalez Domenzain on 18/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Declarations.h"

@interface Parser : NSObject
+ (WeatherObject *)parseWeatherObject;
+ (WeatherDetail *)parseWeatherDetail;
+ (NSMutableArray *)parseWeatherDetails;
+ (Weather *)parseWeather;
@end
