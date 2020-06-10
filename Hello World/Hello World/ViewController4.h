//
//  ViewController4.h
//  Hello World
//
//  Created by Felipe Rios on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController4 : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIButton *UIButtonGetter;
}

@property (nonatomic, retain) IBOutlet UIPickerView *UIPickerViewS;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonGetter;
@property (nonatomic, retain) NSArray *ArrDBPickerView;

- (IBAction)GetSelectedItem:(id)sender;

@end
