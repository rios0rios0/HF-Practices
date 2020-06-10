//
//  ViewController3.m
//  Hello World
//
//  Created by Felipe Rios on 24/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController3.h"

@implementation ViewController3
@synthesize UIDatePickerS, UIButtonGetter;

- (IBAction)GetSelectedItem:(id)sender {
    NSDate *SelectedDate = [UIDatePickerS date];
    NSDateFormatter *FormatedDate = [[NSDateFormatter alloc] init];
    [FormatedDate setDateFormat: @"EEE YYYY/MM/dd h:mm a"];
    NSString *StrDate = [FormatedDate stringFromDate: SelectedDate];
    [FormatedDate release];
    NSString *AlertMsg = [[NSString alloc] initWithFormat: @"Data e Hora Selecionada: %@",
                          StrDate];
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle: @"UIDatePicker" message: AlertMsg delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
    [Alert show];
    [Alert release];
    [AlertMsg release];
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate *NowDate = [[NSDate alloc] init];
    [UIDatePickerS setDate: NowDate animated: NO];
    [NowDate release];
}


- (void)viewDidUnload
{
    UIDatePickerS = nil;
    UIButtonGetter = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
