//
//  Weather.h
//  CM-JsonObject
//
//  Created by Walter Gonzalez Domenzain on 18/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherDetail.h"

@interface Weather : NSObject
@property (nonatomic,strong)  NSMutableArray    *weatherDetails;

-(WeatherDetail *)getWeatherDetail: (int) index;
@end
