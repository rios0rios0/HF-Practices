//
//  DetailViewController.h
//  DrinkMixer
//
//  Created by Felipe Rios on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    NSDictionary *NSDicDrink;
    IBOutlet UITextField *UITextFieldName;
    IBOutlet UITextView *UITextViewIngredients;
    IBOutlet UITextView *UITextViewDirections;
    IBOutlet UIScrollView *UIScrVwS;
}

@property (nonatomic, retain) NSDictionary *NSDicDrink;
@property (nonatomic, retain) UITextField *UITextFieldName;
@property (nonatomic, retain) UITextView *UITextViewIngredients;
@property (nonatomic, retain) UITextView *UITextViewDirections;
@property (nonatomic, retain) UIScrollView *UIScrVwS;

- (IBAction)DoneKeyBoard:(id)sender;

@end
