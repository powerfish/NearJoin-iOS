//
//  EventTableViewController.m
//  NearJoin
//
//  Created by Quan Yu on 8/30/15.
//  Copyright (c) 2015 Quan Yu. All rights reserved.
//

#import "EventViewController.h"
#import "AppDelegate.h"
#import "GTLMyEvent.h"
#import "EventCell.h"

@interface EventViewController ()

@end

@implementation EventViewController
@synthesize studyArray;
@synthesize sportArray;
@synthesize entertainmentArray;
@synthesize othersArray;
@synthesize currentArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.dataSource = self;
    
    AppDelegate * delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    GTLServiceMyEvent* service = [delegate myEventService];
    studyArray = [[NSMutableArray alloc] init];
    sportArray = [[NSMutableArray alloc] init];
    entertainmentArray = [[NSMutableArray alloc] init];
    othersArray = [[NSMutableArray alloc] init];
    
    GTLQueryMyEvent *query = [GTLQueryMyEvent queryForListEvents];
    [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLMyEventCollectionResponseEventRecord *objects, NSError *error) {
        NSArray *items = [objects items];
        for (GTLMyEventEventRecord* e in items) {
            int category = [e.category intValue];
            if(category==1){      [studyArray addObject:e];}
            else if(category==2){ [sportArray addObject:e];}
            else if(category==3){ [entertainmentArray addObject:e];}
            else {                [othersArray addObject:e]; }
        }
        
        [self display:1];
    }];
    
}

-(void)display:(NSInteger) category
{
    switch (category) {
        case 1:
            self.currentArray = studyArray;
            break;
        case 2:
            self.currentArray = sportArray;
            break;
        case 3:
            self.currentArray = entertainmentArray;
            break;
        case 4:
            self.currentArray = othersArray;
            break;
            
        default:
            break;
    }
    [self.tableView reloadData];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.currentArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
  
    // Configure the cell...
    
    GTLMyEventEventRecord* record = self.currentArray[indexPath.row];
    cell.titleLabel.text = record.title;
    cell.timeLabel.text = [record.timeStamp stringValue];
    cell.locationLabel.text = record.location;
    cell.hostLabel.text = record.host;
    cell.descLabel.text = record.descriptionProperty;
    
    NSString* participants = @"";
    for(int i=0;i<record.participants.count;i++)
        participants = [NSString stringWithFormat:@"%@; %@", record.participants[i] , participants ];
    cell.participantsLabel.text = participants;
    
    return cell;
}

- (IBAction)studyClicked:(UIButton *)sender {
    currentArray = studyArray;
    [self.tableView reloadData];
}

- (IBAction)sportClicked:(UIButton *)sender {
    currentArray = sportArray;
    [self.tableView reloadData];
}

- (IBAction)entertainmentClicked:(UIButton *)sender {
    currentArray = entertainmentArray;
    [self.tableView reloadData];
}

- (IBAction)othersClicked:(UIButton *)sender {
    currentArray = othersArray;
    [self.tableView reloadData];
}


- (IBAction)unwindEventView:(UIStoryboardSegue *)segue
{
    // update user log in info if user signed out
    
    // do something if user post a new event
    // re-download envents
    AppDelegate * delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    GTLServiceMyEvent* service = [delegate myEventService];
    [studyArray removeAllObjects] ;
    [sportArray removeAllObjects];
    [entertainmentArray removeAllObjects];
    [othersArray removeAllObjects];
    
    GTLQueryMyEvent *query = [GTLQueryMyEvent queryForListEvents];
    [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLMyEventCollectionResponseEventRecord *objects, NSError *error) {
        NSArray *items = [objects items];
        for (GTLMyEventEventRecord* e in items) {
            int category = [e.category intValue];
            if(category==1){      [studyArray addObject:e];}
            else if(category==2){ [sportArray addObject:e];}
            else if(category==3){ [entertainmentArray addObject:e];}
            else {                [othersArray addObject:e]; }
        }
        
        [self display:1];
    }];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
