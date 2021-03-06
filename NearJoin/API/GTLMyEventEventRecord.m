/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLMyEventEventRecord.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   myEvent/v1
// Description:
//   This is an API
// Classes:
//   GTLMyEventEventRecord (0 custom class methods, 12 custom properties)

#import "GTLMyEventEventRecord.h"

// ----------------------------------------------------------------------------
//
//   GTLMyEventEventRecord
//

@implementation GTLMyEventEventRecord
@dynamic category, descriptionProperty, endDate, extraContactInfo, host,
         hostUrl, location, participants, startDate, status, timeStamp, title;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map = @{
    @"descriptionProperty" : @"description",
    @"endDate" : @"end_date",
    @"hostUrl" : @"host_url",
    @"startDate" : @"start_date"
  };
  return map;
}

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map = @{
    @"participants" : [NSString class]
  };
  return map;
}

@end
