//
//  ViewController6.h
//  Hello World
//
//  Created by Felipe Rios on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define STATE 0
#define CITY 1

@interface ViewController6 : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIButton *UIButtonGetter;
}

@property (nonatomic, retain) IBOutlet UIPickerView *UIPickerViewS;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonGetter;
@property (nonatomic, retain) NSDictionary *DicStateCity;
@property (nonatomic, retain) NSArray *ArrSate;
@property (nonatomic, retain) NSArray *ArrCity;

- (IBAction)GetSelectedItem:(id)sender;

@end
