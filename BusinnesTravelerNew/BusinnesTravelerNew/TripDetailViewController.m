//
//  TripDetailViewController.m
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import "TripDetailViewController.h"
#import "Trip.h"

@interface TripDetailViewController ()



@property (weak, nonatomic) IBOutlet UILabel *tripNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *departureLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivalLabel;
@property (weak, nonatomic) IBOutlet UILabel *reasonLabel;
@property (weak, nonatomic) IBOutlet UILabel *meansLabel;


@end

@implementation TripDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.theTrip.name;
    self.tripNameLabel.text =self.theTrip.name;
    self.destinationLabel.text =self.theTrip.dest;
    self.departureLabel.text =self.theTrip.initialdate;
    self.arrivalLabel.text =self.theTrip.finaldate;
    self.reasonLabel.text =self.theTrip.reason;
    self.meansLabel.text =self.theTrip.means;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
