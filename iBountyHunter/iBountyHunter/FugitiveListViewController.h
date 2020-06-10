//
//  FugitiveListViewController.h
//  iBountyHunter
//
//  Created by Felipe Rios on 30/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FugitiveListViewController : UITableViewController 
<NSFetchedResultsControllerDelegate > {
    NSFetchedResultsController *resultsController;
}
    
@property (nonatomic, retain) NSFetchedResultsController *resultsController;
    
@end
