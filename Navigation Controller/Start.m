//
//  ViewController.m
//  Google Maps
//
//  Created by xax on 8/11/16.
//  Copyright © 2016 xax. All rights reserved.
//
#import "Start.h"
#import <Google/Analytics.h>
#import "Details.h"


@import GoogleMaps;

float latitude;
float longitude;

@interface Start ()

@end

@implementation Start {
    GMSMapView *mapView_;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    //[self viewWillAppear];
}
-(void)viewWillAppear:(BOOL)animated
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display t
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:36.200621 longitude:-115.275286 zoom:4];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.delegate=self;
    self.view = mapView_;

}
/**********************************************************************************************/
#pragma mark - GMSMapViewDelegate
/**********************************************************************************************/

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate {
    [mapView_ clear];
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    /*Global variables to share the coordinate*/
    latitude=coordinate.latitude;
    longitude=coordinate.longitude;
    
    marker.map = mapView_;
    [self performSegueWithIdentifier:@"Details" sender:self];
}

/**********************************************************************************************/
#pragma mark - SEGUE
/**********************************************************************************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*
    if([segue.destinationViewController isKindOfClass:[Details class]])
    {
      Place to share the coordinate variables to the next Details class
    }
     */
}







@end
