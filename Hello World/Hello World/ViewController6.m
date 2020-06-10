//
//  ViewController6.m
//  Hello World
//
//  Created by Felipe Rios on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController6.h"

@implementation ViewController6
@synthesize UIPickerViewS, UIButtonGetter, DicStateCity, ArrSate, ArrCity;

- (IBAction)GetSelectedItem:(id)sender {
    NSString *SelectedState = [ArrSate objectAtIndex: [UIPickerViewS selectedRowInComponent: STATE]];
    NSString *SelectedCity = [ArrCity objectAtIndex: [UIPickerViewS selectedRowInComponent: CITY]];
    NSString *Msg = [[NSString alloc] initWithFormat: @"%@ Fica no %@", SelectedCity, SelectedState];
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle: @"DB State e City" message: Msg delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
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
        return [self.ArrSate count];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == CITY)
        return [self.ArrCity objectAtIndex: row];
    else
        return [self.ArrSate objectAtIndex: row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == STATE) {
        NSString *SelectedState = [self.ArrSate objectAtIndex: row];
        NSArray *ArrResume = [DicStateCity objectForKey: SelectedState];
        self.ArrCity = ArrResume;
        
        [UIPickerViewS selectRow: 0 inComponent: CITY animated: YES];
        [UIPickerViewS reloadComponent: CITY];
    }
}

- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == STATE)
        return 60;
    else
        return 235;
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
    NSBundle *BunPack = [NSBundle mainBundle];
    NSString *Path = [BunPack pathForResource: @"DBPickerView" ofType: @"plist"];
    NSDictionary *DicAcess = [[NSDictionary alloc] initWithContentsOfFile: Path];
    self.DicStateCity = DicAcess;
    [DicAcess release];
    
    NSArray *ArrComponents = [self.DicStateCity allKeys];
    NSArray *ArrClass = [ArrComponents sortedArrayUsingSelector: @selector(compare:)];
    self.ArrSate = ArrClass;
    
    NSString *SelectedState = [self.ArrSate objectAtIndex: 0];
    NSArray *ArrResume = [DicStateCity objectForKey: SelectedState];
    self.ArrCity = ArrResume;
    
}


- (void)viewDidUnload
{
    self.UIPickerViewS = nil;
    self.UIButtonGetter = nil;
    self.DicStateCity = nil;
    self.ArrSate = nil;
    self.ArrCity = nil;
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
