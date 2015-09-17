//
//  MyEvent.m
//  NearJoin
//
//  Created by Quan Yu on 8/30/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import "MyEvent.h"

@implementation MyEvent

@synthesize host;
@synthesize host_url;
@synthesize title;
@synthesize category;
@synthesize location;
@synthesize time;
@synthesize duration;
@synthesize desc;
@synthesize phone;

-(id)init
{
    self = [super init];
    return self;
}

@end
