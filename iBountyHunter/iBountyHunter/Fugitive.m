//
//  Fugitive.m
//  iBountyHunter
//
//  Created by Felipe Rios on 31/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fugitive.h"


@implementation Fugitive

@dynamic bounty;
@dynamic captdate;
@dynamic captured;
@dynamic capturedLat;
@dynamic capturedLon;
@dynamic desc;
@dynamic fugitiveID;
@dynamic image;
@dynamic name;

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D capturedCoord;
    capturedCoord.latitude = [self.capturedLat doubleValue];
    capturedCoord.longitude = [self.capturedLon doubleValue];
    
    return capturedCoord;
}

- (NSString *)title {
    return self.name;
}

- (NSString *)subtitle {
    return self.desc;
}

@end
