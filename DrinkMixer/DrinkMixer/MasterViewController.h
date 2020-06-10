//
//  MasterViewController.h
//  DrinkMixer
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController {
    NSMutableArray *MArrDrinks;
    IBOutlet UIBarButtonItem *UIBrBtnItmAdd;
}

@property (nonatomic, retain) NSMutableArray *MArrDrinks;
@property (nonatomic, retain) UIBarButtonItem *UIBrBtnItmAdd;

- (IBAction)AddButtonPressed:(id)sender;
- (void)applicationWillTerminate: (NSNotification *)notification;

@end