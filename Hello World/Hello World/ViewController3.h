//
//  ViewController3.h
//  Hello World
//
//  Created by Felipe Rios on 24/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController3 : UIViewController {
    UIButton *UIButtonGetter;
}

@property (nonatomic, retain) IBOutlet UIDatePicker *UIDatePickerS;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonGetter;

- (IBAction)GetSelectedItem:(id)sender;

@end
