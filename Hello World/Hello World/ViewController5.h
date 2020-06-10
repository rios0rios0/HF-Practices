//
//  ViewController5.h
//  Hello World
//
//  Created by Felipe Rios on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CITY 0
#define TRANSPORT 1

@interface ViewController5 : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIButton *UIButtonGetter;
}

@property (nonatomic, retain) IBOutlet UIPickerView *UIPickerViewS;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonGetter;
@property (nonatomic, retain) NSArray *ArrCity;
@property (nonatomic, retain) NSArray *ArrTransport;

- (IBAction)GetSelectedItem:(id)sender;

@end
