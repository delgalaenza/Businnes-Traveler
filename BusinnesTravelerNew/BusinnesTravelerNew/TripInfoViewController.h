//
//  TripInfoViewController.h
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 15/10/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import "ViewController.h"
#import "Trip.h"
#import "Timer.h"

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

UIToolbar* toolbar;
UIDatePicker* picker;

UIToolbar* toolbar1;
UIDatePicker* picker1;

@interface TripInfoViewController : UIViewController



//trip timer
@property (nonatomic, strong) Timer* timer;

//core Location
@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation* currentLocation;

//property oggetto trip
@property (nonatomic, strong) Trip* trip;


//dates
- (IBAction)showFirstDate:(id)sender;


- (IBAction)showSecondDate:(id)sender;


//textFields
@property (weak, nonatomic) IBOutlet UITextField *tripName;
@property (weak, nonatomic) IBOutlet UITextField *tripDest;
@property (weak, nonatomic) IBOutlet UITextField *tripMotivation;
@property (weak, nonatomic) IBOutlet UITextField *tripMean;



//prove
@property (weak, nonatomic) IBOutlet UILabel *provaCampi;
@property (weak, nonatomic) IBOutlet UILabel *provaTrip;

@end
