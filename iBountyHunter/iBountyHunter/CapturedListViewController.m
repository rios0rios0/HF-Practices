//
//  CapturedListViewController.m
//  iBountyHunter
//
//  Created by Felipe Rios on 30/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fugitive.h"
#import "AppDelegate.h"
#import "CapturedListViewController.h"
#import "FugitiveDetailViewController.h"

@implementation CapturedListViewController
@synthesize resultsController;

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

#pragma mark table view methods
// pragma datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.resultsController sections] count];
}

// Numero de linhas da table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.resultsController sections] objectAtIndex: section] numberOfObjects];
}

// Aparência das células da table view.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    // Configure a célula...
    //Fugitive *fugitive = [self.resultsController objectAtIndex: indexPath];
    Fugitive *fugitive = [self.resultsController objectAtIndexPath: [NSIndexPath indexPathForRow: indexPath.row inSection: 0]]; //ATUALIZAÇÂO APPLE
    
    cell.textLabel.text = fugitive.name;
    return cell;
}

//#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    FugitiveDetailViewController *fugitiveDetailViewController = [[FugitiveDetailViewController alloc] initWithNibName:@"FugitiveDetailViewController" bundle:nil];
    
    //fugitiveDetailViewController.fugitive = [self.resultsController objectAtIndex: indexPath];
    fugitiveDetailViewController.fugitive = [self.resultsController objectAtIndexPath: [NSIndexPath indexPathForRow: indexPath.row inSection: 0]]; //ATUALIZAÇÂO APPLE
    
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController: fugitiveDetailViewController animated:YES];
    [fugitiveDetailViewController release];
}

- (void)dealloc {
    [resultsController release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    if (self.resultsController != nil) {
        return;
    }
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entiry = [NSEntityDescription entityForName: @"Fugitive" inManagedObjectContext: managedObjectContext];
    [request setEntity: entiry];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"captured == YES"];
    [request setPredicate: predicate];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey: @"name" ascending: YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects: sortDescriptor, nil];
    [request setSortDescriptors: sortDescriptors];
    [sortDescriptors release];
    [sortDescriptor release];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest: request managedObjectContext: managedObjectContext sectionNameKeyPath: nil cacheName: @"captured_list.cache"];
    fetchedResultsController.delegate = self;
    
    NSError *error;
    BOOL sucess = [fetchedResultsController performFetch: &error];
    //NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest: request error: &error] mutableCopy];
    //if (mutableFetchResults == nil) {
    if (!sucess) {
        // Lida com o erro.
    }
    //self.items = mutableFetchResults;
    self.resultsController = fetchedResultsController;
    //[mutableFetchResults release];
    [request release];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
