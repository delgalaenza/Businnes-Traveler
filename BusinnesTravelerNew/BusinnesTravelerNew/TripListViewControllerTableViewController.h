//
//  TripListViewControllerTableViewController.h
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripDataSource.h"
#import "trip.h"

@interface TripListViewControllerTableViewController : UITableViewController

@property (nonatomic, strong) id<TripDataSource> dataSource;

@property (nonatomic, strong) Trip* tripToAdd;

@end
