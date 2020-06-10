//
//  ViewController.m
//  InstaTwit
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController 
@synthesize UIPickerViewTweet, UITextFieldNotes;

- (IBAction)SedButtonTapped:(id)sender {
    NSString *Msg = [[NSString alloc] initWithFormat: @"%@. I'm %@ and feeling %@ about it.", UITextFieldNotes.text ? UITextFieldNotes.text :@"", [ArrActivities objectAtIndex: [UIPickerViewTweet selectedRowInComponent: 0]], [ArrFeelings objectAtIndex: [UIPickerViewTweet selectedRowInComponent: 1]]];
    //TWITTER BLACK MAGIC
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: @"http://TWITTER:PASSWORD@twitter.com/statuses/update.xml"] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 60.0];
    [theRequest setHTTPMethod: @"POST"];
    [theRequest setHTTPBody: [[NSString stringWithFormat: @"status=%@", Msg] dataUsingEncoding: NSASCIIStringEncoding]];
    NSURLResponse *response;
    NSError *error;
    NSData *result = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &response error: &error];
    NSLog(@"%@", [[[NSString alloc] initWithData: result encoding: NSASCIIStringEncoding] autorelease]);
    //END TWITTER BLACK MAGIC
}

- (IBAction)DoneKeyBoard:(id)sender {
    [sender resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0)
        return [ArrActivities count];
    else
        return [ArrFeelings count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0)
        return [ArrActivities objectAtIndex: row];
    else
        return [ArrFeelings objectAtIndex: row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ArrActivities = [[NSArray alloc] initWithObjects: @"sleeping", @"eating", @"working", @"thinking", @"crying", @"begging", @"leaving", @"shopping", @"hello worlding", nil];
    ArrFeelings = [[NSArray alloc] initWithObjects: @"awesome", @"sad", @"happy", @"ambivalent", @"nauseous", @"psyched", @"confused", @"hoperful", @"anxious", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
