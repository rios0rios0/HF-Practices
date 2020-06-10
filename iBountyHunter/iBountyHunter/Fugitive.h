//
//  Fugitive.h
//  iBountyHunter
//
//  Created by Felipe Rios on 31/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@interface Fugitive : NSManagedObject <MKAnnotation> {
}

@property (nonatomic, retain) NSDecimalNumber * bounty;
@property (nonatomic, retain) NSDate * captdate;
@property (nonatomic, retain) NSNumber * captured;
@property (nonatomic, retain) NSNumber * capturedLat;
@property (nonatomic, retain) NSNumber * capturedLon;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * fugitiveID;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * name;

#pragma mark -
#pragma mark MapKit Annotation Protocol

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (NSString *)title;
- (NSString *)subtitle;

@end
