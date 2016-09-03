//
//  WeatherObject.h
//  CM-JsonObject
//
//  Created by Walter Gonzalez Domenzain on 18/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"
#import "MainObject.h"
#import "WeatherDetail.h"
#import "Weather.h"

@interface WeatherObject : NSObject
@property (nonatomic) Coord         *coord;
@property (nonatomic) int           ID;
@property (nonatomic) NSString      *name;
@property (nonatomic) MainObject    *main;
@property (nonatomic) Weather       *weather;
@end
