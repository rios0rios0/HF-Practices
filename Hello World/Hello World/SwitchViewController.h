//
//  SwitchViewController.h
//  Hello World
//
//  Created by Felipe Rios on 24/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "ViewController6.h"

@interface SwitchViewController : UIViewController {
    ViewController2 *viewController2;
    ViewController3 *viewController3;
    ViewController4 *viewController4;
    ViewController5 *viewController5;
    ViewController6 *viewController6;
    UIBarButtonItem *UIBarBtnItmNext;
    UIBarButtonItem *UIBarBtnItmBack;
}

@property (nonatomic, retain) ViewController2 *viewController2;
@property (nonatomic, retain) ViewController3 *viewController3;
@property (nonatomic, retain) ViewController4 *viewController4;
@property (nonatomic, retain) ViewController5 *viewController5;
@property (nonatomic, retain) ViewController6 *viewController6;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *UIBarBtnItmNext;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *UIBarBtnItmBack;

- (IBAction)NextView:(id)sender;
- (IBAction)BackView:(id)sender;

@end
