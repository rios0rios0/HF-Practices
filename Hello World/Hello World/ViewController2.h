//
//  ViewController2.h
//  Hello World
//
//  Created by Felipe Rios on 24/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController <UIActionSheetDelegate> {
    UILabel *UILabelShowText;
    UILabel *UILabelAlertView;
    UILabel *UILabelShowAlert;
    UISwitch *UISwitchS;
    UISlider *UISliderS;
    UIButton *UIButtonASheet;
    UIButton *UIButton1;
    UIButton *UIButton2;
    UIButton *UIButton3;
    UIButton *UIButton4;
    UIImageView *UIImageViewBackGround;
    UITextField *UITextFieldNote;
    UISegmentedControl *UISegmentControlS;
}

@property (nonatomic, retain) IBOutlet UILabel *UILabelShowText;
@property (nonatomic, retain) IBOutlet UILabel *UILabelAlertView;
@property (nonatomic, retain) IBOutlet UILabel *UILabelShowAlert;
@property (nonatomic, retain) IBOutlet UISwitch *UISwitchS;
@property (nonatomic, retain) IBOutlet UISlider *UISliderS;
@property (nonatomic, retain) IBOutlet UIButton *UIButtonASheet;
@property (nonatomic, retain) IBOutlet UIButton *UIButton1;
@property (nonatomic, retain) IBOutlet UIButton *UIButton2;
@property (nonatomic, retain) IBOutlet UIButton *UIButton3;
@property (nonatomic, retain) IBOutlet UIButton *UIButton4;
@property (nonatomic, retain) IBOutlet UIImageView *UIImageViewBackGround;
@property (nonatomic, retain) IBOutlet UITextField *UITextFieldNote;
@property (nonatomic, retain) IBOutlet UISegmentedControl *UISegmentControlS;

- (IBAction)PressButton:(id)sender;
- (IBAction)DoneKeyBoard:(id)sender;
- (IBAction)ChangeSlider:(id)sender;
- (IBAction)ChangeSwitch:(id)sender;
- (IBAction)SegmentPress:(id)sender;
- (IBAction)ButtonASheetPress:(id)sender;
- (IBAction)DoneValue;

@end
