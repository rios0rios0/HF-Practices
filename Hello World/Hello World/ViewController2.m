//
//  ViewController2.m
//  Hello World
//
//  Created by Felipe Rios on 24/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController2.h"

@implementation ViewController2
@synthesize UILabelShowText, UILabelAlertView, UILabelShowAlert, UISwitchS, UISliderS, UIButtonASheet, UIButton1, UIButton2, UIButton3, UIButton4, UIImageViewBackGround, UITextFieldNote, UISegmentControlS;

- (IBAction)PressButton:(id)sender {
    NSString *pTitulo = [sender titleForState: UIControlStateNormal];
    NSString *pNovoTexto = [[NSString alloc] initWithFormat: @"Botao %@ Pressionado.", pTitulo];
    UILabelShowText.text = pNovoTexto; //[labelTexto setText: pNovoTexto];
    //QUANDO DECLARADO UM OUTLET-PONTEIRO FAZ-SE A LIMPEZA DO MESMO EX: 
    [pNovoTexto release];
}

- (IBAction)DoneKeyBoard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)ChangeSlider:(id)sender {
    UISlider *sli = (UISlider *) sender;
    UITextFieldNote.text = [NSString stringWithFormat: @"%.1f", sli.value];
}

- (IBAction)ChangeSwitch:(id)sender {
    UISwitch *swi = (UISwitch *) sender;
    if (swi.isOn == YES)
        UISliderS.hidden = NO;
    else
        UISliderS.hidden = YES;
}

- (IBAction)SegmentPress:(id)sender {
    if ([sender selectedSegmentIndex] == 0)
        UIButtonASheet.hidden = NO;
    else
        UIButtonASheet.hidden = YES;
}

- (IBAction)ButtonASheetPress:(id)sender {
    UIActionSheet *AS = [[UIActionSheet alloc] initWithTitle: @"Deseja Prosseguir" delegate: self cancelButtonTitle: @"Não" destructiveButtonTitle: @"Sim" otherButtonTitles: @"Talvez", @"De Repente", nil];
    AS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [AS showInView: self.view];
    [AS release];
}

- (IBAction)DoneValue {
    [UISliderS setValue: [UITextFieldNote.text floatValue] animated: YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSString *msg = nil;
    switch (buttonIndex) {
        case 0:
            msg = @"Sim - 0";
            break;
        case 1:
            msg = @"Talvez - 1";
            break;
        case 2:
            msg = @"De Repente - 2";
            break;
        case 3:
            msg = @"Não - 3";
            break;
    }
    UIAlertView *AV = [[UIAlertView alloc] initWithTitle: @"Você Apertou No Botão:" message: msg delegate: self cancelButtonTitle: @"Valeu" otherButtonTitles: @"OK", nil];
    [AV show];
    [AV release];
}

- (void)alertView:(UIAlertView *) alert
didDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            UILabelShowAlert.text = @"Valeu - 0";
            break;
        case 1:
            UILabelShowAlert.text = @"OK - 1";            
            break;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *imgButtonSheetNormal = [UIImage imageNamed: @"ActionSheet Normal.png"];
    UIImage *imgRedButtonSheetNormal = [imgButtonSheetNormal stretchableImageWithLeftCapWidth: 12 topCapHeight: 0];
    UIImage *imgButtonSheetSelected = [UIImage imageNamed: @"ActionSheet Selected.png"];
    UIImage *imgRedButtonSheetSelected = [imgButtonSheetSelected stretchableImageWithLeftCapWidth: 12 topCapHeight: 0];
    [UIButtonASheet setBackgroundImage: imgRedButtonSheetNormal forState: UIControlStateNormal];
    [UIButtonASheet setBackgroundImage: imgRedButtonSheetSelected forState: UIControlStateHighlighted];
}


- (void)viewDidUnload
{
    UILabelShowText = nil;
    UILabelAlertView = nil;
    UILabelShowAlert = nil;
    UISwitchS = nil;
    UISliderS = nil;
    UIButtonASheet = nil;
    UIButton1 = nil;
    UIButton2 = nil;
    UIButton3 = nil;
    UIButton4 = nil;
    UIImageViewBackGround = nil;
    UITextFieldNote = nil;
    UISegmentControlS = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
