//
//  MapViewController.m
//  NearJoin
//
//  Created by quan on 9/11/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import "MapViewController.h"
@import GoogleMaps;

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView_;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Create a GMSCameraPosition that tells the map to display the
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:39.999441
                                                            longitude:-83.008715
                                                                 zoom:15];
    mapView_.camera = camera;
    mapView_.mapType = kGMSTypeNormal; // kGMSTypeNormal kGMSTypeHybrid kGMSTypeSatellite kGMSTypeTerrainkGMSTypeNone
    
    //Controls whether the My Location dot and accuracy circle is enabled.
    mapView_.myLocationEnabled = YES;
    
    //Shows the my location button on the map
    mapView_.settings.myLocationButton = YES;
    
    //Shows the compass button on the map
    mapView_.settings.compassButton = YES;
    
    mapView_.delegate = self;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(39.999441, -83.008715);
    marker.title = @"ACCAD";
    marker.snippet = @"Advanced Computing Center for the Arts and Design";
    marker.map = mapView_;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    //NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
    
    id handler = ^(GMSReverseGeocodeResponse *response, NSError *error) {
        if (error == nil) {
            [mapView clear];// clear previous markers
            
            GMSReverseGeocodeResult *result = response.firstResult;
            GMSMarker *marker = [GMSMarker markerWithPosition:coordinate];
            marker.title = result.lines[0];
            marker.snippet = result.lines[1];
            marker.map = mapView;
            
            self.strLocation = [NSString stringWithFormat:@"%@, %@", result.lines[0], result.lines[1]];
        }
    };
    
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:coordinate completionHandler:handler];
    
    /*
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:coordinate completionHandler:
     ^(GMSReverseGeocodeResponse *response, NSError *error){
         NSLog(@"Address: %@", response.firstResult);
     }];
    */
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture {
    //[mapView clear];
}

- (void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)cameraPosition {
    
    id handler = ^(GMSReverseGeocodeResponse *response, NSError *error) {
        if (error == nil) {
            GMSReverseGeocodeResult *result = response.firstResult;
            GMSMarker *marker = [GMSMarker markerWithPosition:cameraPosition.target];
            marker.title = result.lines[0];
            marker.snippet = result.lines[1];
            marker.map = mapView;
        }
    };
    //[geocoder_ reverseGeocodeCoordinate:cameraPosition.target completionHandler:handler];
}


@end
