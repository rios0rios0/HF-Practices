//
//  AppDelegate.h
//  DrinkMixer
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UINavigationController *navigationController;

@end
