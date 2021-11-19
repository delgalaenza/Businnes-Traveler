//
//  TripRecapViewController.h
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "trip.h"

@interface TripRecapViewController : UIViewController

@property (nonatomic, strong) NSString* dest;

@property (nonatomic, strong) NSNumber* timer;

@property (weak, nonatomic) IBOutlet UILabel *provaSegue;

@property (weak, nonatomic) IBOutlet UILabel *provaTimer;


@end
