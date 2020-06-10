//
//  FugitiveDetailViewController.h
//  iBountyHunter
//
//  Created by Felipe Rios on 30/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fugitive.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class Fugitive;

@interface FugitiveDetailViewController : UIViewController <CLLocationManagerDelegate, UIAlertViewDelegate> {
    CLLocationManager *locationManager;
    Fugitive *fugitive;
    UILabel *fugitiveNameLabel;
    UILabel *fugitiveIdLabel;
    UILabel *fugitiveBountyLabel;
    UILabel *capturedDateLabel;
    UILabel *capturedLatLon;
    UITextView *fugitiveDescriptionView;
    UISegmentedControl *capturedToggle;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) Fugitive *fugitive;
@property (nonatomic, retain) IBOutlet UILabel *fugitiveNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *fugitiveIdLabel;
@property (nonatomic, retain) IBOutlet UILabel *fugitiveBountyLabel;
@property (nonatomic, retain) IBOutlet UILabel *capturedDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *capturedLatLon;
@property (nonatomic, retain) IBOutlet UITextView *fugitiveDescriptionView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *capturedToggle;

- (IBAction)CapturedToggleChanged:(id)sender;
- (IBAction)ShowInfoButtonPressed:(id)sender;

@end
