//
//  MapViewController.h
//  NearJoin
//
//  Created by quan on 9/11/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//
#import <GoogleMaps/GoogleMaps.h>
#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController<GMSMapViewDelegate>

@property (strong, nonatomic) NSString *strLocation;
@property (weak, nonatomic) IBOutlet GMSMapView *mapView_;

@end
