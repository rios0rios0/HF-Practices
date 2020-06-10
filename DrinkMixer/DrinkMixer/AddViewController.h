//
//  AddViewController.h
//  DrinkMixer
//
//  Created by Felipe Rios on 28/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface AddViewController : DetailViewController {
    BOOL keyboardVisible;
    NSMutableArray *ArrDrinks;
}

@property (nonatomic, retain) NSMutableArray *ArrDrinks;

- (void)keyboardDidShow:(NSNotification *)notif;
- (void)keyboardDidHide:(NSNotification *)notif;
- (IBAction)Cancel:(id)sender;
- (IBAction)Save:(id)sender;

@end
