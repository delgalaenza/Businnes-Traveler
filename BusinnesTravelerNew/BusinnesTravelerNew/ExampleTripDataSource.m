//
//  ExampleTripDataSource.m
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import "ExampleTripDataSource.h"
#import "Trip.h"

@interface ExampleTripDataSource()

@property (nonatomic, strong) TripList *trips;

- (void) addTrips;

@end

@implementation ExampleTripDataSource

- (instancetype) init {
    if(self = [super init]){
        _trips = [[TripList alloc] init];
        [self addTrips];
    }
    return self;
}

- (void) addTrips{
    [self.trips add: [[Trip alloc] initWithName:@"school trip" dest:@"Milano" initialdate:@"December 8, 2020" finaldate:@"December 9, 2020" reason:@"fun" means:@"autobus"]];
    [self.trips add: [[Trip alloc] initWithName:@"Project A" dest:@"London" initialdate:@"December 9, 2020" finaldate:@"December 11, 2020" reason:@"work" means:@"plane"]];
    [self.trips add: [[Trip alloc] initWithName:@"Project B" dest:@"Catania" initialdate:@"December 10, 2020" finaldate:@"December 12, 2020" reason:@"work" means:@"boat"]];

}

- (TripList *)getTrips{
    return self.trips;
}


@end
