//
//  EventTableViewController.h
//  NearJoin
//
//  Created by Quan Yu on 8/30/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyEvent.h"

@interface EventViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray * studyArray;
@property (nonatomic, strong) NSMutableArray * sportArray;
@property (nonatomic, strong) NSMutableArray * entertainmentArray;
@property (nonatomic, strong) NSMutableArray * othersArray;
@property (nonatomic, strong) NSMutableArray * currentArray;

- (IBAction)studyClicked:(UIButton *)sender;
- (IBAction)sportClicked:(UIButton *)sender;
- (IBAction)entertainmentClicked:(UIButton *)sender;
- (IBAction)othersClicked:(UIButton *)sender;

- (IBAction)unwindEventView:(UIStoryboardSegue *)segue;


-(void)display:(NSInteger) category;
@end
