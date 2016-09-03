//
//  OCMapperConfig.m
//  CM-JsonObject
//
//  Created by Walter Gonzalez Domenzain on 18/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//  4266be5cf3f88c6ae6ffdc5ce7808324
//  api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=4266be5cf3f88c6ae6ffdc5ce7808324
//  api.openweathermap.org/data/2.5/weather?lat=20.695307&lon=-103.418190&APPID=4266be5cf3f88c6ae6ffdc5ce7808324
//
#import "OCMapperConfig.h"
#import "OCMapper.h"
#import <UIKit/UIKit.h>


@implementation OCMapperConfig
+ (void)configure
{
    InCodeMappingProvider *inCodeMappingProvider = [[InCodeMappingProvider alloc] init];
    CommonLoggingProvider *commonLoggingProvider = [[CommonLoggingProvider alloc] initWithLogLevel:LogLevelError];
    
    [[ObjectMapper sharedInstance] setMappingProvider:inCodeMappingProvider];
    [[ObjectMapper sharedInstance] setLoggingProvider:commonLoggingProvider];
    
    /******************* Any custom mapping would go here **********************/
    
    // Map from key 'posTables' to property 'posTables' of type 'LeagueTable' which is a property of 'LeagueTables' class
    [inCodeMappingProvider mapFromDictionaryKey:@"coord"
                                  toPropertyKey:@"coord"
                                 withObjectType:[Coord class]
                                       forClass:[WeatherObject class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"weather"
                                  toPropertyKey:@"weatherDetails"
                                 withObjectType:[WeatherDetail class]
                                       forClass:[Weather class]];
    


}
@end
