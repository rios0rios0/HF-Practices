//
//  CapturedPhotoViewController.m
//  iBountyHunter
//
//  Created by Felipe Rios on 31/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fugitive.h"
#import "CapturedPhotoViewController.h"

@implementation CapturedPhotoViewController
@synthesize fugitiveImage, fugitive, fugitiveMapView;

- (IBAction)DoneButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)TakePictureButton:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        NSLog(@"This device has camera, ask the user what they want to do.");
        UIActionSheet *photoSourceSheet = [[UIActionSheet alloc] initWithTitle: @"Select Fugitive Picture" delegate: self cancelButtonTitle: @"Cancel" destructiveButtonTitle: nil otherButtonTitles: @"Take New Photo", @"Choose Existing Photo", nil];
        photoSourceSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        [photoSourceSheet showInView: self.view];
        [photoSourceSheet release];        
    } else { // Sem câmera, provavelmente um iPod Touch
        NSLog(@"No camera avaliable on the device. Defaulting to library.");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        [self presentModalViewController: picker animated: YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    self.fugitive.image = UIImagePNGRepresentation(image);
    
    [self dismissModalViewControllerAnimated: YES];
    [picker release];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated: YES];
    [picker release];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    self.fugitiveImage.image = [[[UIImage alloc] initWithData: fugitive.image] autorelease];
    
    if ([fugitive.captured boolValue] == YES) {
        CLLocationCoordinate2D mapCenter;
        mapCenter.latitude = [fugitive.capturedLat doubleValue];
        mapCenter.longitude = [fugitive.capturedLon doubleValue];
        
        MKCoordinateSpan mapSpan;
        mapSpan.latitudeDelta = 0.005;
        mapSpan.longitudeDelta = 0.005;
        
        MKCoordinateRegion mapRegion;
        mapRegion.center = mapCenter;
        mapRegion.span = mapSpan;
        
        self.fugitiveMapView.region = mapRegion;
        self.fugitiveMapView.mapType = MKMapTypeHybrid;
    }
    [self.fugitiveMapView addAnnotation: fugitive];
}

- (void)dealloc {
    [fugitive release];
    [fugitiveImage release];
    [fugitiveMapView release];
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
