//
//  MasterViewController.m
//  DrinkMixer
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddViewController.h"
#import "DrinkConstats.h"

@implementation MasterViewController
@synthesize MArrDrinks, UIBrBtnItmAdd;

- (IBAction)AddButtonPressed:(id)sender {
    //NSLog(@"Add Button Pressed!");
    AddViewController *addViewController = [[AddViewController alloc] initWithNibName: @"DetailViewController" bundle: nil];
    UINavigationController *UINAvControllerAdd = [[UINavigationController alloc] initWithRootViewController: addViewController];
    addViewController.ArrDrinks = self.MArrDrinks;
    [self presentModalViewController: UINAvControllerAdd animated: YES];
    [UINAvControllerAdd release];
    [addViewController release];
}

- (void)applicationWillTerminate: (NSNotification *)notification {
    NSString *Path = [[NSBundle mainBundle] pathForResource: @"DrinkDirections" ofType: @"plist"];
    [self.MArrDrinks writeToFile: Path atomically: YES];
}

#pragma mark table view methods
// pragma datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Numero de linhas da table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.MArrDrinks count];
}

// Aparência das células da table view.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell.
    cell.textLabel.text = [[self.MArrDrinks objectAtIndex: indexPath.row] objectForKey: NAME_KEY];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.editing) {
        DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
        
        detailViewController.NSDicDrink = [self.MArrDrinks objectAtIndex: indexPath.row];
        [self.navigationController pushViewController: detailViewController animated:YES];
        [detailViewController release];
    } else {
        AddViewController *editingDrinkViewController = [[AddViewController alloc] initWithNibName: @"DetailViewController" bundle: nil];
        UINavigationController *editingNavigationController = [[UINavigationController alloc] initWithRootViewController: editingDrinkViewController];
        editingDrinkViewController.NSDicDrink = [self.MArrDrinks objectAtIndex: indexPath.row];
        editingDrinkViewController.ArrDrinks = self.MArrDrinks;
        [self.navigationController presentModalViewController: editingNavigationController animated: YES];
        [editingDrinkViewController release];
        [editingNavigationController release];
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [self.MArrDrinks removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Drink Mixer";
    }
    return self;
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
    NSString *Path = [[NSBundle mainBundle] pathForResource: @"DrinkDirections" ofType: @"plist"];
    NSMutableArray *Tmp = [[NSMutableArray alloc] initWithContentsOfFile: Path];
    self.MArrDrinks = Tmp;
    [Tmp release];
    self.navigationItem.rightBarButtonItem = self.UIBrBtnItmAdd;
    // Registre para informação de saída da aplicação, para pordermos salvar os dados
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(applicationWillTerminate:) name: UIApplicationWillTerminateNotification object: nil];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    // Remova o registro para notificação
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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

- (void)dealloc
{
    [UIBrBtnItmAdd release];
    [MArrDrinks release];
    [super dealloc];
}


@end
