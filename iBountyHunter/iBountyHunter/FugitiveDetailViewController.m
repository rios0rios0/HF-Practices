//
//  FugitiveDetailViewController.m
//  iBountyHunter
//
//  Created by Felipe Rios on 30/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fugitive.h"
#import "CapturedPhotoViewController.h"
#import "FugitiveDetailViewController.h"

@implementation FugitiveDetailViewController
@synthesize fugitive, fugitiveNameLabel, fugitiveIdLabel, fugitiveBountyLabel, capturedDateLabel, capturedLatLon, fugitiveDescriptionView, capturedToggle;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"Core location claims to have a position.");
    capturedToggle.enabled = YES;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Core location says no-go on the position info.");
    capturedToggle.enabled = NO;
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Core location says no-go on the position info." delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
    [Alert show];
    [Alert release];
}

- (IBAction)ShowInfoButtonPressed:(id)sender {
    CapturedPhotoViewController *Controller = [[CapturedPhotoViewController alloc] initWithNibName: @"CapturedPhotoViewController" bundle: nil];
    
    Controller.fugitive = self.fugitive;
    Controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController: Controller animated: YES];
    [Controller release];
}

- (IBAction)CapturedToggleChanged:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        NSDate *Now = [NSDate date];
        /*NSDateFormatter *FormatedDate = [[NSDateFormatter alloc] init];
        [FormatedDate setDateFormat: @"EEE YYYY/MM/dd h:mm a"];
        NSString *StrDate = [FormatedDate stringFromDate: Now];
        [FormatedDate release];*/
        fugitive.captdate = Now;
        fugitive.captured = [NSNumber numberWithBool: YES];
        CLLocation *curPos = self.locationManager.location;
        fugitive.capturedLat = [NSNumber numberWithDouble: curPos.coordinate.latitude];
        fugitive.capturedLon = [NSNumber numberWithDouble: curPos.coordinate.longitude];
    } else {
        fugitive.captdate = nil;
        fugitive.capturedLat = nil;
        fugitive.capturedLon = nil;
        fugitive.captured = [NSNumber numberWithBool: NO];
    }
    capturedDateLabel.text = [fugitive.captdate description];
    capturedLatLon.text = [NSString stringWithFormat: @"%.3f, %.3f", [fugitive.capturedLat doubleValue], [fugitive.capturedLon doubleValue]];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    NSString *Name = [[NSString alloc] initWithFormat: @"Name: %@", fugitive.name];
    NSString *ID = [[NSString alloc] initWithFormat: @"ID# %@", [fugitive.fugitiveID stringValue]];
    NSString *Bounty = [[NSString alloc] initWithFormat: @"Bounty: $%@", [fugitive.bounty stringValue]];
    
    fugitiveNameLabel.text = Name;
    fugitiveIdLabel.text = ID;
    fugitiveBountyLabel.text = Bounty;
    capturedDateLabel.text = [fugitive.captdate description];
    capturedLatLon.text = [NSString stringWithFormat: @"%.3f, %3.f", [fugitive.capturedLat doubleValue], [fugitive.capturedLon doubleValue]];
    fugitiveDescriptionView.text = fugitive.desc;
    capturedToggle.selectedSegmentIndex = [fugitive.captured boolValue] ? 0 : 1;
    [Name release];
    [ID release];
    [Bounty release];
    //[self.locationManager startUpdatingLocation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    NSLog(@"Shutting down core location...");
    [self.locationManager stopUpdatingLocation];
    self.locationManager = nil;
}

- (void)dealloc {
    [fugitive release];
    [fugitiveNameLabel release];
    [fugitiveIdLabel release];
    [fugitiveBountyLabel release];
    [capturedLatLon release];
    [capturedDateLabel release];
    [fugitiveDescriptionView release];
    [capturedToggle release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
