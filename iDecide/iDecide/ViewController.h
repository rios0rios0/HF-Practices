//
//  ViewController.h
//  iDecide
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UILabel *UILabelDecision;
}

@property (nonatomic, retain) IBOutlet UILabel *UILabelDecision;

- (IBAction)ButtonPressed:(id)sender;

@end
