//
//  TripDataSource.h
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TripList.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TripDataSource <NSObject>

- (TripList *) getTrips;

@end

NS_ASSUME_NONNULL_END

