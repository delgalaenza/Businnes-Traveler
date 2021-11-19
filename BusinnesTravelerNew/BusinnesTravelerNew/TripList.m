//
//  TripList.m
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 08/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import "TripList.h"

@interface TripList ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation TripList

- (instancetype)init{
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (long)size{
    return self.list.count;
}

- (NSArray *)getAll{
    return self.list;
}

- (void)add:(Trip *)t{
    [self.list addObject:t];
}

- (Trip *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}
@end
