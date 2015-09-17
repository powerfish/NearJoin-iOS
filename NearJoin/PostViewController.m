//
//  PostViewController.m
//  NearJoin
//
//  Created by Quan Yu on 8/30/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import "PostViewController.h"
#import "DatePickerViewController.h"
#import "MapViewController.h"
#import "AppDelegate.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender == self.startTimeButton)
    {
        DatePickerViewController* targetController = [segue destinationViewController];
        targetController.startOrEnd = true;
    }
    else if(sender == self.endTimeButton)
    {
        DatePickerViewController* targetController = [segue destinationViewController];
        targetController.startOrEnd = false;
    }
    else if(sender == self.mapButton)
    {
        
    }
}


- (IBAction)unwindPostView:(UIStoryboardSegue *)segue
{
    UIViewController* sourceViewController = segue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[DatePickerViewController class]])
    {
        DatePickerViewController* picker = (DatePickerViewController*)sourceViewController;
        if(picker.startOrEnd)
            self.startTimeTextField.text = picker.strDate;
        else
            self.endTimeTextField.text = picker.strDate;
    }
    if ([segue.identifier isEqualToString:@"doneMapToPostView"]) {
        MapViewController *source = [segue sourceViewController];
        if(source!=nil)
        {
            self.locationTextField.text = source.strLocation;
        }
    }
}


- (IBAction)postEvent:(UIBarButtonItem *)sender {

    AppDelegate * delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    GTLServiceMyEvent* service = [delegate myEventService];

    //TODO: check event's parameters here
    
    GTLQueryMyEvent *query = [GTLQueryMyEvent queryForAddEventWithCategory: self.categorySegmentedControl.selectedSegmentIndex+1                                             descriptionProperty:self.descriptionTextField.text
        endDate:self.endTimeTextField.text
        extraContactInfo:self.phoneTextField.text
        host:@"XYZ"
        hostUrl:@"www.google.com"
        location:self.locationTextField.text
        startDate:self.startTimeTextField.text
        title: self.titleTextField.text ];
                              
    [service executeQuery:query completionHandler:nil];
}
@end
