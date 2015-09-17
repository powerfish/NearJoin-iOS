//
//  PostViewController.h
//  NearJoin
//
//  Created by Quan Yu on 8/30/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *categorySegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *startTimeTextField;
@property (strong, nonatomic) IBOutlet UITextField *endTimeTextField;

@property (strong, nonatomic) IBOutlet UIButton *startTimeButton;
@property (strong, nonatomic) IBOutlet UIButton *endTimeButton;
@property (strong, nonatomic) IBOutlet UIButton *mapButton;

- (IBAction)postEvent:(UIBarButtonItem *)sender;

- (IBAction)unwindPostView:(UIStoryboardSegue *)segue;

@end
