//
//  TripList.h
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "trip.h"

@interface TripList : NSObject

- (long)size;
- (NSArray *)getAll;
- (void)add:(Trip *)f;
- (Trip *)getAtIndex:(NSInteger)index;

@end
