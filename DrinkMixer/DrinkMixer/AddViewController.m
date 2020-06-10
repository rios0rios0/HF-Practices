//
//  AddViewController.m
//  DrinkMixer
//
//  Created by Felipe Rios on 28/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"
#import "DetailViewController.h"
#import "DrinkConstats.h"

@implementation AddViewController
@synthesize ArrDrinks;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) dealloc {
    [ArrDrinks release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    NSLog(@"Registering for keyboard events");
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardDidShow:) name: UIKeyboardDidShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardDidHide:) name: UIKeyboardDidHideNotification object: nil];
    keyboardVisible = NO;
    UITextFieldName.enabled = YES;
    UITextViewIngredients.editable = YES;
    UITextViewDirections.editable = YES;
    if (self.NSDicDrink != nil) {
        UITextFieldName.text = [self.NSDicDrink objectForKey: NAME_KEY];
        UITextViewIngredients.text = [self.NSDicDrink objectForKey: INGREDIENTS_KEY];
        UITextViewDirections.text = [self.NSDicDrink objectForKey: DIRECTIONS_KEY];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"Unregistering for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void)keyboardDidShow: (NSNotification *)notif {
    //NSLog(@"Received UIKeyBoardDidShowNotification.");
    if (keyboardVisible) {
        NSLog(@"Keyboard is already visible. Ingnoring notification.");
        return;
    }
    NSLog(@"Resizing smaller for keyboard");
    NSDictionary *info = [notif userInfo];
    NSValue *NSValueS = [info objectForKey: UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [NSValueS CGRectValue].size;
    
    CGRect viewFrame = self.view.frame;
    viewFrame.size.height -= keyboardSize.height;
    UIScrVwS.frame = viewFrame;
    keyboardVisible = YES;
}

- (void)keyboardDidHide: (NSNotification *)notif {
    //NSLog(@"Received UIKeyBoardDidHideNotification.");
    if (!keyboardVisible) {
        NSLog(@"Keyboard already hidden. Ignoring notification");
        return;
    }
    NSLog(@"Resizing bigger with no keyboard");
    NSDictionary *info = [notif userInfo];
    NSValue *NSValueS = [info objectForKey: UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [NSValueS CGRectValue].size;
    
    CGRect viewFrame = self.view.frame;
    viewFrame.size.height += keyboardSize.height;
    UIScrVwS.frame = viewFrame;
    keyboardVisible = NO;    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
#pragma Save and Cancel

- (IBAction)Save:(id)sender {
    //NSLog(@"Save Pressed!");
    
    if (NSDicDrink != nil) {
        // Estamos trabalhando com um drink já existente, então vamos remove-lo do array e nos
        // preparar para um novo
        [ArrDrinks removeObject: NSDicDrink];
        self.NSDicDrink = nil; // Isso libera a referencia também
    }
    
    NSMutableDictionary *NewDrink = [[NSMutableDictionary alloc] init];
    [NewDrink setValue: UITextFieldName.text forKey: NAME_KEY];
    [NewDrink setValue: UITextViewIngredients.text forKey: INGREDIENTS_KEY];
    [NewDrink setValue: UITextViewDirections.text forKey: DIRECTIONS_KEY];
    
    [ArrDrinks addObject: NewDrink];
    [NewDrink release];
    //Orde ao array, já que acabamos de incluir um novo drink
    NSSortDescriptor *NameSorter = [[NSSortDescriptor alloc] initWithKey: NAME_KEY ascending: YES selector: @selector(caseInsensitiveCompare:)];
    [ArrDrinks sortUsingDescriptors: [NSArray arrayWithObject: NameSorter]];
    [NameSorter release];
    
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)Cancel:(id)sender {
    //NSLog(@"Cancel Pressed!");
    [self dismissModalViewControllerAnimated: YES];
}

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
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemCancel target: self action: @selector(Cancel:)] autorelease];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSave target: self action: @selector(Save:)] autorelease];
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
