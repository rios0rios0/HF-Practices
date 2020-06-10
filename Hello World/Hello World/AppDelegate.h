//
//  AppDelegate.h
//  Hello World
//
//  Created by Felipe Rios on 24/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitchViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    SwitchViewController *switchViewController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwitchViewController *switchViewController;

@end
