//
//  MainObject.h
//  CM-JsonObject
//
//  Created by Walter Gonzalez Domenzain on 18/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainObject : NSObject
@property (nonatomic) float temp;
@property (nonatomic) int pressure;
@property (nonatomic) int humidity;
@property (nonatomic) float temp_min;
@property (nonatomic) float temp_max;
@end
