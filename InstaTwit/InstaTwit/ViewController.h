//
//  ViewController.h
//  InstaTwit
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView *UIPickerViewTweet;
    UITextField *UITextFieldNotes;
    NSArray *ArrActivities;
    NSArray *ArrFeelings;
}

@property (nonatomic, retain) IBOutlet UIPickerView *UIPickerViewTweet;
@property (nonatomic, retain) IBOutlet UITextField *UITextFieldNotes;

- (IBAction)SedButtonTapped:(id)sender;
- (IBAction)DoneKeyBoard:(id)sender;

@end
