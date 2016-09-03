//
//  Weather.m
//  CM-JsonObject
//
//  Created by Jose on 9/2/16.
//  Copyright © 2016 robert. All rights reserved.
//


#import "Weather.h"

@implementation Weather


-(WeatherDetail *)getWeatherDetail: (int) index{
    
    return self.weatherDetails[index];
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.weatherDetails = [[NSMutableArray alloc] init];
    }
    return self;
    
}

@end
