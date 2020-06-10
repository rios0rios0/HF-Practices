//
//  AppDelegate.m
//  DrinkMixer
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize navigationController;

#pragma mark -
#pragma mark Application lifecycle
 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.

    MasterViewController *masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

/*#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Override point for customization after app launch    
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}*/

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end
