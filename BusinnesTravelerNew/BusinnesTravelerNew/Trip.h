//
//  Trip.h
//  BusinnesTravelerNew
//
//  Created by Lorenzo Del Gaudio on 07/11/2021.
//  Copyright © 2021 Lorenzo Del Gaudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trip : NSObject

@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSString* dest;
@property (nonatomic,strong) NSString* initialdate;
@property (nonatomic,strong) NSString* finaldate;
@property (nonatomic,strong) NSString* reason;
@property (nonatomic,strong) NSString* means;

//inizializzatore designato
- (instancetype) initWithName:(NSString*)name
                         dest:(NSString*)dest
                  initialdate:(NSString*)initialdate
                    finaldate:(NSString*)finaldate
                       reason:(NSString*)reason
                        means:(NSString*)means;

@end
