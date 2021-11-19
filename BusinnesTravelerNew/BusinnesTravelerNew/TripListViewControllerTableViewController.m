//
//  TripListViewControllerTableViewController.m
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import "TripListViewControllerTableViewController.h"
#import "ExampleTripDataSource.h"
#import "TripDetailViewController.h"

@interface TripListViewControllerTableViewController ()

@property (nonatomic, strong) TripList *trips;

@end

@implementation TripListViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"My trips list";
    self.dataSource = [[ExampleTripDataSource alloc] init];
    if(self.dataSource != nil){
        self.trips = [self.dataSource getTrips];
    }
    [self.trips add:self.tripToAdd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.trips.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripCell" forIndexPath:indexPath];
    Trip *f = [self.trips getAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text = f.name;
    return cell;
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowTripDetails"]){
        if([segue.destinationViewController isKindOfClass:[TripDetailViewController class]]){
            TripDetailViewController *vc = (TripDetailViewController*)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Trip *t= [self.trips getAtIndex:indexPath.row];
            vc.theTrip = t;
        }
    }
}
@end
