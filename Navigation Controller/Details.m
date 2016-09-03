//
//  Details.m
//  Google Maps
//
//  Created by Jose on 9/2/16.
//  Copyright © 2016 robert. All rights reserved.
//


#import "Details.h"
#import "Start.h"
//OCMapper
#import "OCMapperConfig.h"

//OCMapper
#define nUagLat 20.695306
#define nUagLng -103.418190

float latitude_;
float longitude_;

@interface Details ()

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Init];
    
    //OCMapper
    [OCMapperConfig configure];
    [self initData];
}

- (void)initData {
    mjsonWeatherObject              = [Declarations getWeather:latitude_ and:longitude_];
    mWeatherObject                  = [Parser parseWeatherObject];
    Weather *weather                = [Parser parseWeather];
    
    WeatherDetail *weatherDetail    = [weather getWeatherDetail:0];
    //print(NSLog(@"icon %@", weatherDetail.icon))
    //print(NSLog(@"Name %@", mWeatherObject.name))
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)Init {
    
    latitude_=latitude;
    longitude_=longitude;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnGetDataPressed:(id)sender {
    //mjsonWeatherObject    = [Declarations getWeather:nUagLat and:nUagLng];
    mjsonWeatherObject    = [Declarations getWeather:latitude_ and:longitude_];
    mWeatherObject  = [Parser parseWeatherObject];
    
    float tempKelvin        = mWeatherObject.main.temp;
    float tempCelsius       = tempKelvin - 273.15;
    self.lblTemp.text       = [NSString stringWithFormat:@"%.2f", tempCelsius];
    self.lblTempMax.text    = [NSString stringWithFormat:@"%.2f", mWeatherObject.main.temp_max - 273.15];
    self.lblTempMin.text    = [NSString stringWithFormat:@"%.2f", mWeatherObject.main.temp_min - 273.15];
    self.lblPressure.text   = [NSString stringWithFormat:@"%d", mWeatherObject.main.pressure];
    self.lblHumidity.text   = [NSString stringWithFormat:@"%d", mWeatherObject.main.humidity];
}
@end
