//
//  Weather.h
//  CM-JsonObject
//
//  Created by Walter Gonzalez Domenzain on 18/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDetail : NSObject
@property (nonatomic) int                   ID;
@property (nonatomic,strong)  NSString      *main;
@property (nonatomic,strong)  NSString      *Description;
@property (nonatomic,strong)  NSString      *icon;

@end
