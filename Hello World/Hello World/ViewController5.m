//
//  ViewController5.m
//  Hello World
//
//  Created by Felipe Rios on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController5.h"

@implementation ViewController5
@synthesize UIPickerViewS, UIButtonGetter, ArrCity, ArrTransport;

- (IBAction)GetSelectedItem:(id)sender {
    NSString *SelectedCity = [ArrCity objectAtIndex: [UIPickerViewS selectedRowInComponent: CITY]];
    NSString *SelectedTransport = [ArrTransport objectAtIndex: [UIPickerViewS selectedRowInComponent: TRANSPORT]];
    NSString *Msg = [[NSString alloc] initWithFormat: @"Você Vai Para %@ de %@", SelectedCity, SelectedTransport];
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle: @"DB City e Transport" message: Msg delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
    [Alert show];
    [Alert release];
    [Msg release];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == CITY)
        return [self.ArrCity count];
    else
        return [self.ArrTransport count];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == CITY)
        return [self.ArrCity objectAtIndex: row];
    else
        return [self.ArrTransport objectAtIndex: row];
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
    NSArray *InitializeCity = [[NSArray alloc] initWithObjects: @"SP", @"RJ", @"Camaçari", nil];
    self.ArrCity = InitializeCity;
    [InitializeCity release];
    NSArray *InitializeTransport = [[NSArray alloc] initWithObjects: @"Moto", @"Carro", @"Bicicleta", nil];
    self.ArrTransport = InitializeTransport;
    [InitializeTransport release];
}


- (void)viewDidUnload
{
    self.UIPickerViewS = nil;
    self.UIButtonGetter = nil;
    self.ArrCity = nil;
    self.ArrTransport = nil;
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
