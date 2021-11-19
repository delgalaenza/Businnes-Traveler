//
//  Trip.m
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 07/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import "Trip.h"

@implementation Trip


- (instancetype) initWithName:(NSString*)name
                         dest:(NSString*)dest
                  initialdate:(NSString*)initialdate
                    finaldate:(NSString*)finaldate
                       reason:(NSString*)reason
                        means:(NSString*)means{
    if(self = [super init]){
        _name = [name copy];
        _dest = [dest copy];
        _initialdate = [initialdate copy];
        _finaldate = [finaldate copy];
        _reason = [reason copy];
        _means = [means copy];
    }
    return self;
}


@end
