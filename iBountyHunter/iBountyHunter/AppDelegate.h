//
//  AppDelegate.h
//  iBountyHunter
//
//  Created by Felipe Rios on 30/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UITabBarController *tabController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void)createEditableCopyOfDatabaseIfNeed;

@end
