//
//  ViewController.m
//  NearJoin
//
//  Created by Quan Yu on 8/30/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)unwindMainView:(UIStoryboardSegue *)segue
{
    /*
    // update the two parameters after return from settings view
    if ([segue.identifier isEqualToString:@"doneSettingsToBeaconList"]) {
        SettingsViewController *source = [segue sourceViewController];
        if(source!=nil)
        {
            _scanningFrequency = source.frequency;   //NSLog(@"Scanning Frequency = %i", _scanningFrequency);
            _filterWindowSize = source.windowSize;   //NSLog(@"Filter Window Size = %i", _filterWindowSize);
        }
    }
    // nothing to do if the settings is canceled
    //if ([segue.identifier isEqualToString:@"cancelSettingsToBeaconList"]) {
    //    SettingsViewController *source = [segue sourceViewController];
    //}
    
    if ([segue.identifier isEqualToString:@"doneBeaconSettingToBeaconList"]) {
        BeaconSettingViewController *source = [segue sourceViewController];
        if(source!=nil)
        {
            self.beacon.threshold = source.threshold;   //NSLog(@"Beacon Threshold = %i", self.beacon.threshold);
            self.beacon.url = source.url;               //NSLog(@"Beacon URL = %@", self.beacon.url);
            
            
            [self.beaconListView reloadData];
        }
    }
     */
}

@end
