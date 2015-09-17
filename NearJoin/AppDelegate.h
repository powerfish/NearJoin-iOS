//
//  AppDelegate.h
//  NearJoin
//
//  Created by Quan Yu on 8/30/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTLMyEvent.h"
#import "GTMHTTPFetcherLogging.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


- (GTLServiceMyEvent *)myEventService ;

@end

