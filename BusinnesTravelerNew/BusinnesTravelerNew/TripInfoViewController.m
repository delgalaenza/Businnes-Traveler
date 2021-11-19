//
//  TripInfoViewController.m
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 15/10/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import "TripInfoViewController.h"
#import "TripRecapViewController.h"
#import "TripListViewControllerTableViewController.h"



@interface TripInfoViewController () <CLLocationManagerDelegate>


@end

@implementation TripInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"my trip";
    
    _trip = [[Trip alloc]
                 initWithName: @"xxx" dest:@"xxx"  initialdate:@"xxx"  finaldate:@"xxx"  reason:@"xxx"  means:@"xxx"
                 ];
    
    _provaTrip.text = _trip.dest;
    
    // CORE LOCATION
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.locationManager.distanceFilter = 100;
    self.locationManager.delegate = self;
    
    //init timer
    _timer = [[Timer alloc] init];
    
    //hidden prove
    [_provaTrip setHidden:YES];
    [_provaCampi setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)openMaps:(id)sender {
    [_timer startTimer];
    
    [self.locationManager startUpdatingLocation];
    
    //riempimento dell'oggetto trip
    _trip.dest = _tripDest.text;
    _trip.name = _tripName.text;
    _trip.reason = _tripMotivation.text;
    _trip.means = _tripMean.text;

    // Check for iOS 6
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:_tripDest.text  //finaldest
                     completionHandler:^(NSArray *placemarks, NSError *error) {
                         
                         // Convert the CLPlacemark to an MKPlacemark
                         // Note: There's no error checking for a failed geocode
                         CLPlacemark *geocodedPlacemark = [placemarks objectAtIndex:0];
                         MKPlacemark *placemark = [[MKPlacemark alloc]
                                                   initWithCoordinate:geocodedPlacemark.location.coordinate
                                                   addressDictionary:geocodedPlacemark.addressDictionary];
                         
                         // Create a map item for the geocoded address to pass to Maps app
                         MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
                         [mapItem setName:geocodedPlacemark.name];
                         
                         // Set the directions mode to "Driving"
                         // Can use MKLaunchOptionsDirectionsModeWalking instead
                         NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
                         
                         // Get the "Current User Location" MKMapItem
                         MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
                         
                         // Pass the current location and destination map items to the Maps app
                         // Set the direction mode in the launchOptions dictionary
                         
                         
                         [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem] launchOptions:launchOptions];
                         
                        
                     }];
    }
}


/******** CORE LOCATION *********/

- (CLLocationManager *)locationManager{
    if(!_locationManager) _locationManager = [[CLLocationManager alloc] init];
    return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *currentLocation = [locations lastObject];
    self.currentLocation = currentLocation;
    //cicla array
}


/******** GESTIONE DATE ***************/

- (IBAction)showFirstDate:(id)sender {
    //stile date Picker
    picker = [[UIDatePicker alloc] init];
    picker.backgroundColor = [UIColor whiteColor];
    [picker setValue:[UIColor blackColor] forKey:@"textColor"];
    
    picker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    picker.datePickerMode = UIDatePickerModeDate;
    
    [picker addTarget:self action:@selector(dueDateChanged:) forControlEvents:UIControlEventValueChanged];
    picker.frame = CGRectMake(0.0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 300);
    [self.view addSubview:picker];
    
    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 50)];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    toolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButtonClick)]];
    [toolbar sizeToFit];
    [self.view addSubview:toolbar];
}

- (IBAction)showSecondDate:(id)sender {
    
    //stile date Picker
    picker1 = [[UIDatePicker alloc] init];
    picker1.backgroundColor = [UIColor whiteColor];
    [picker1 setValue:[UIColor blackColor] forKey:@"textColor"];
    
    picker1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    picker1.datePickerMode = UIDatePickerModeDate;
    
    [picker1 addTarget:self action:@selector(dueDateChanged1:) forControlEvents:UIControlEventValueChanged];
    picker1.frame = CGRectMake(0.0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 300);
    [self.view addSubview:picker1];
    
    toolbar1 = [[UIToolbar alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 300, [UIScreen mainScreen].bounds.size.width, 50)];
    toolbar1.barStyle = UIBarStyleBlackTranslucent;
    toolbar1.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButtonClick1)]];
    [toolbar1 sizeToFit];
    [self.view addSubview:toolbar1];

}


-(void) dueDateChanged:(UIDatePicker *)sender {
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSLog(@"Picked the date %@", [dateFormatter stringFromDate:[sender date]]);
    //YOUR_LABEL.TEXT = [dateFormatter stringFromDate:[sender date]];
    _trip.initialdate = [dateFormatter stringFromDate:[sender date]];
}

-(void)onDoneButtonClick {
    [toolbar removeFromSuperview];
    [picker removeFromSuperview];
}

-(void) dueDateChanged1:(UIDatePicker *)sender {
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSLog(@"Picked the date %@", [dateFormatter stringFromDate:[sender date]]);
    //YOUR_LABEL.TEXT = [dateFormatter stringFromDate:[sender date]];
    _trip.finaldate = [dateFormatter stringFromDate:[sender date]];
}

-(void)onDoneButtonClick1 {
    [toolbar1 removeFromSuperview];
    [picker1 removeFromSuperview];
}

/********+ PREPARE FOR SEGUES ****************/
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowRecap"]){
        if([segue.destinationViewController isKindOfClass:[TripRecapViewController class]]){
            [_timer stopTimer];
            TripRecapViewController *vc = (TripRecapViewController *)segue.destinationViewController;
            vc.dest = _trip.dest;
            vc.timer = [_timer timeElapsedInSeconds];
        }
    }
    
    if([segue.identifier isEqualToString:@"AddTrip"]){
        if([segue.destinationViewController isKindOfClass:[TripListViewControllerTableViewController class]]){
            TripListViewControllerTableViewController *vc = (TripListViewControllerTableViewController*)segue.destinationViewController;
            vc.tripToAdd = _trip;
        }
    }}

@end










