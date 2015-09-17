/* This file was generated by the ServiceGenerator.
 * The ServiceGenerator is Copyright (c) 2015 Google Inc.
 */

//
//  GTLQueryMyEvent.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   myEvent/v1
// Description:
//   This is an API
// Classes:
//   GTLQueryMyEvent (8 custom class methods, 11 custom properties)

#import "GTLQueryMyEvent.h"

#import "GTLMyEventCollectionResponseEventRecord.h"
#import "GTLMyEventCollectionResponseString.h"

@implementation GTLQueryMyEvent

@dynamic category, descriptionProperty, endDate, extraContactInfo, fields, host,
         hostUrl, location, participant, startDate, title;

+ (NSDictionary *)parameterNameMap {
  NSDictionary *map = @{
    @"descriptionProperty" : @"description",
    @"endDate" : @"end_date",
    @"hostUrl" : @"host_url",
    @"startDate" : @"start_date"
  };
  return map;
}

#pragma mark -
#pragma mark Service level methods
// These create a GTLQueryMyEvent object.

+ (instancetype)queryForAddEventWithCategory:(NSInteger)category
                         descriptionProperty:(NSString *)descriptionProperty
                                     endDate:(NSString *)endDate
                            extraContactInfo:(NSString *)extraContactInfo
                                        host:(NSString *)host
                                     hostUrl:(NSString *)hostUrl
                                    location:(NSString *)location
                                   startDate:(NSString *)startDate
                                       title:(NSString *)title {
  NSString *methodName = @"myEvent.addEvent";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.category = category;
  query.descriptionProperty = descriptionProperty;
  query.endDate = endDate;
  query.extraContactInfo = extraContactInfo;
  query.host = host;
  query.hostUrl = hostUrl;
  query.location = location;
  query.startDate = startDate;
  query.title = title;
  return query;
}

+ (instancetype)queryForAddParticipantWithParticipant:(NSString *)participant
                                                title:(NSString *)title {
  NSString *methodName = @"myEvent.addParticipant";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.participant = participant;
  query.title = title;
  return query;
}

+ (instancetype)queryForDeleteEventWithTitle:(NSString *)title {
  NSString *methodName = @"myEvent.deleteEvent";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.title = title;
  return query;
}

+ (instancetype)queryForDeleteParticipantWithParticipant:(NSString *)participant
                                                   title:(NSString *)title {
  NSString *methodName = @"myEvent.deleteParticipant";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.participant = participant;
  query.title = title;
  return query;
}

+ (instancetype)queryForListEvents {
  NSString *methodName = @"myEvent.listEvents";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.expectedObjectClass = [GTLMyEventCollectionResponseEventRecord class];
  return query;
}

+ (instancetype)queryForListEventsByCategoryWithCategory:(NSInteger)category {
  NSString *methodName = @"myEvent.listEventsByCategory";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.category = category;
  query.expectedObjectClass = [GTLMyEventCollectionResponseEventRecord class];
  return query;
}

+ (instancetype)queryForListEventsByHostWithHost:(NSString *)host {
  NSString *methodName = @"myEvent.listEventsByHost";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.host = host;
  query.expectedObjectClass = [GTLMyEventCollectionResponseEventRecord class];
  return query;
}

+ (instancetype)queryForListParticipantsWithTitle:(NSString *)title {
  NSString *methodName = @"myEvent.listParticipants";
  GTLQueryMyEvent *query = [self queryWithMethodName:methodName];
  query.title = title;
  query.expectedObjectClass = [GTLMyEventCollectionResponseString class];
  return query;
}

@end
