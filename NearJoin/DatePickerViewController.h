//
//  DataPickerViewController.h
//  NearJoin
//
//  Created by quan on 9/11/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property bool startOrEnd; // true if this view is used to pick a date for start time; false if it is used for end time.

@property (strong, nonatomic) NSString *strDate;

@property (strong, nonatomic) IBOutlet UIDatePicker *picker;


@end
