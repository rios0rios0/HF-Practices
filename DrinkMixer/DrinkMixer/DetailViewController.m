//
//  DetailViewController.m
//  DrinkMixer
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "DrinkConstats.h"

@implementation DetailViewController
@synthesize NSDicDrink, UITextFieldName, UITextViewIngredients, UITextViewDirections, UIScrVwS;

- (IBAction)DoneKeyBoard:(id)sender {
    [sender resignFirstResponder];
}

- (void)dealloc
{
    [UIScrVwS release];
    [NSDicDrink release];
    [UITextFieldName release];
    [UITextViewIngredients release];
    [UITextViewDirections release];
    [super dealloc];
}

#pragma mark - Managing the detail item


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
    UIScrVwS.contentSize = self.view.frame.size;
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
    UITextFieldName.text = [NSDicDrink objectForKey: NAME_KEY];
    UITextViewIngredients.text = [NSDicDrink objectForKey: INGREDIENTS_KEY];
    UITextViewDirections.text = [NSDicDrink objectForKey: DIRECTIONS_KEY];
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Drink Mixer";
    }
    return self;
}
							
@end
