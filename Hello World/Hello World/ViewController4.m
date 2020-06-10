//
//  ViewController4.m
//  Hello World
//
//  Created by Felipe Rios on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController4.h"

@implementation ViewController4
@synthesize UIPickerViewS, UIButtonGetter, ArrDBPickerView;

- (IBAction)GetSelectedItem:(id)sender {
    NSString *Selected = [ArrDBPickerView objectAtIndex: [UIPickerViewS selectedRowInComponent: 0]];
    NSString *Msg = [[NSString alloc] initWithFormat: @"Você Selecionou %@", Selected];
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle: @"DBPickerView" message: Msg delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
    [Alert show];
    [Alert release];
    [Msg release];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.ArrDBPickerView count];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.ArrDBPickerView objectAtIndex: row];
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
    NSArray *Initialize = [[NSArray alloc] initWithObjects: @"Apple", @"Windows", @"Linux", nil];
    self.ArrDBPickerView = Initialize;
    [Initialize release];
}


- (void)viewDidUnload
{
    self.UIPickerViewS = nil;
    self.UIButtonGetter = nil;
    self.ArrDBPickerView = nil;
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
