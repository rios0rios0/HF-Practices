//
//  SwitchViewController.m
//  Hello World
//
//  Created by Felipe Rios on 24/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "ViewController6.h"

@implementation SwitchViewController
@synthesize viewController2, viewController3, viewController4, viewController5, viewController6, UIBarBtnItmNext, UIBarBtnItmBack;

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)InterfaceOrientation duration:(NSTimeInterval)duration {
    UIImage *imgLandscape = [UIImage imageNamed: @"Apple Logo Landscape.png"];
    UIImage *imgNormal = [UIImage imageNamed: @"Apple Logo.png"];
    if (InterfaceOrientation == UIInterfaceOrientationPortrait ||
        InterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [viewController2.UIImageViewBackGround setImage: imgNormal];
        viewController2.UILabelShowText.frame = CGRectMake(20, 419, 280, 21);
        viewController2.UILabelAlertView.frame = CGRectMake(20, 55, 207, 21);
        viewController2.UILabelShowAlert.frame = CGRectMake(221, 55, 79, 21);
        viewController2.UISwitchS.frame = CGRectMake(221, 309, 79, 27);
        viewController2.UISliderS.frame = CGRectMake(18, 344, 284, 23);
        viewController2.UIButtonASheet.frame = CGRectMake(20, 135, 280, 37);
        viewController2.UIButton1.frame = CGRectMake(20, 374, 58, 37);
        viewController2.UIButton2.frame = CGRectMake(96, 374, 58, 37);
        viewController2.UIButton3.frame = CGRectMake(169, 374, 58, 37);
        viewController2.UIButton4.frame = CGRectMake(242, 374, 58, 37);
        viewController2.UIImageViewBackGround.frame = CGRectMake(0, 44, 320, 416);
        viewController2.UITextFieldNote.frame = CGRectMake(20, 305, 192, 30);
        viewController2.UISegmentControlS.frame = CGRectMake(57, 84, 207, 44);
        viewController3.UIButtonGetter.frame = CGRectMake(20, 338, 280, 37);
        viewController4.UIButtonGetter.frame = CGRectMake(20, 338, 280, 37);
        viewController5.UIButtonGetter.frame = CGRectMake(20, 338, 280, 37);
        viewController6.UIButtonGetter.frame = CGRectMake(20, 338, 280, 37);
    } else {
        [viewController2.UIImageViewBackGround setImage: imgLandscape];
        viewController2.UILabelShowText.frame = CGRectMake(100, 259, 280, 21);
        viewController2.UILabelAlertView.frame = CGRectMake(100, 44, 207, 21);
        viewController2.UILabelShowAlert.frame = CGRectMake(301, 44, 79, 21);
        viewController2.UISwitchS.frame = CGRectMake(301, 161, 79, 27);
        viewController2.UISliderS.frame = CGRectMake(98, 196, 284, 23);
        viewController2.UIButtonASheet.frame = CGRectMake(100, 124, 280, 25);
        viewController2.UIButton1.frame = CGRectMake(100, 226, 58, 25);
        viewController2.UIButton2.frame = CGRectMake(176, 226, 58, 25);
        viewController2.UIButton3.frame = CGRectMake(249, 226, 58, 25);
        viewController2.UIButton4.frame = CGRectMake(322, 226, 58, 25);
        viewController2.UIImageViewBackGround.frame = CGRectMake(0, 44, 480, 256);
        viewController2.UITextFieldNote.frame = CGRectMake(100, 157, 192, 30);
        viewController2.UISegmentControlS.frame = CGRectMake(137, 73, 207, 44);
        viewController3.UIButtonGetter.frame = CGRectMake(100, 268, 280, 20);
        viewController4.UIButtonGetter.frame = CGRectMake(100, 268, 280, 20);
        viewController5.UIButtonGetter.frame = CGRectMake(100, 268, 280, 20);
        viewController6.UIButtonGetter.frame = CGRectMake(100, 268, 280, 20);
    }
}

- (IBAction)NextView:(id)sender {
    //BLOCO DE ANIMAÇÂO >>>>>>
    [UIView beginAnimations: @"View Animated" context: nil];
    [UIView setAnimationDuration: 1.0];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    
    if (self.viewController2.view.superview != nil)
    {
        if (self.viewController3 == nil) 
        {
            ViewController3 *Controller3 = [[ViewController3 alloc] initWithNibName: @"View3" bundle: 0];
            self.viewController3 = Controller3;
            [Controller3 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView: self.view cache: YES];
        [viewController2 viewWillAppear: YES];
        [viewController3 viewWillDisappear: YES];
        
        [viewController2.view removeFromSuperview];
        [self.view insertSubview: viewController3.view atIndex: 0];
        
        [viewController3 viewWillDisappear: YES];
        [viewController2 viewWillAppear: YES];
    } else if (self.viewController3.view.superview != nil)
    {
        if (self.viewController4 == nil) 
        {
            ViewController4 *Controller4 = [[ViewController4 alloc] initWithNibName: @"View4" bundle: 0];
            self.viewController4 = Controller4;
            [Controller4 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView: self.view cache: YES];
        [viewController3 viewWillAppear: YES];
        [viewController4 viewWillDisappear: YES];
        
        [viewController3.view removeFromSuperview];
        [self.view insertSubview: viewController4.view atIndex: 0];
        
        [viewController4 viewWillDisappear: YES];
        [viewController3 viewWillAppear: YES];
    } else if (self.viewController4.view.superview != nil)
    {
        if (self.viewController5 == nil) 
        {
            ViewController5 *Controller5 = [[ViewController5 alloc] initWithNibName: @"View5" bundle: 0];
            self.viewController5 = Controller5;
            [Controller5 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView: self.view cache: YES];
        [viewController4 viewWillAppear: YES];
        [viewController5 viewWillDisappear: YES];
        
        [viewController4.view removeFromSuperview];
        [self.view insertSubview: viewController5.view atIndex: 0];
        
        [viewController5 viewWillDisappear: YES];
        [viewController4 viewWillAppear: YES];    
    } else if (self.viewController5.view.superview != nil)
    {
        if (self.viewController6 == nil) 
        {
            ViewController6 *Controller6 = [[ViewController6 alloc] initWithNibName: @"View6" bundle: 0];
            self.viewController6 = Controller6;
            [Controller6 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView: self.view cache: YES];
        [viewController5 viewWillAppear: YES];
        [viewController6 viewWillDisappear: YES];
    
        [viewController5.view removeFromSuperview];
        [self.view insertSubview: viewController6.view atIndex: 0];
    
        [viewController6 viewWillDisappear: YES];
        [viewController5 viewWillAppear: YES];
        UIBarBtnItmNext.enabled = NO;
    }
    [UIView commitAnimations];
    UIBarBtnItmBack.enabled = YES;
}

- (IBAction)BackView:(id)sender {
    //BLOCO DE ANIMAÇÂO >>>>>>
    [UIView beginAnimations: @"View Animated" context: nil];
    [UIView setAnimationDuration: 1.0];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    
    if (self.viewController6.view.superview != nil)
    {
        if (self.viewController5 == nil) 
        {
            ViewController5 *Controller5 = [[ViewController5 alloc] initWithNibName: @"View5" bundle: 0];
            self.viewController5 = Controller5;
            [Controller5 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView: self.view cache: YES];
        [viewController6 viewWillAppear: YES];
        [viewController5 viewWillDisappear: YES];
        
        [viewController6.view removeFromSuperview];
        [self.view insertSubview: viewController5.view atIndex: 0];
        
        [viewController5 viewWillDisappear: YES];
        [viewController6 viewWillAppear: YES];
    } else if (self.viewController5.view.superview != nil)
    {
        if (self.viewController4 == nil) 
        {
            ViewController4 *Controller4 = [[ViewController4 alloc] initWithNibName: @"View4" bundle: 0];
            self.viewController4 = Controller4;
            [Controller4 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView: self.view cache: YES];
        [viewController5 viewWillAppear: YES];
        [viewController4 viewWillDisappear: YES];
        
        [viewController5.view removeFromSuperview];
        [self.view insertSubview: viewController4.view atIndex: 0];
        
        [viewController4 viewWillDisappear: YES];
        [viewController5 viewWillAppear: YES];
    } else if (self.viewController4.view.superview != nil)
    {
        if (self.viewController3 == nil) 
        {
            ViewController3 *Controller3 = [[ViewController3 alloc] initWithNibName: @"View3" bundle: 0];
            self.viewController3 = Controller3;
            [Controller3 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView: self.view cache: YES];
        [viewController4 viewWillAppear: YES];
        [viewController3 viewWillDisappear: YES];
        
        [viewController4.view removeFromSuperview];
        [self.view insertSubview: viewController3.view atIndex: 0];
        
        [viewController3 viewWillDisappear: YES];
        [viewController4 viewWillAppear: YES];
    } else if (self.viewController3.view.superview != nil)
    {
        if (self.viewController2 == nil) 
        {
            ViewController2 *Controller2 = [[ViewController2 alloc] initWithNibName: @"View2" bundle: 0];
            self.viewController2 = Controller2;
            [Controller2 release];
        }
        //BLOCO DE ANIMAÇÂO >>>>>>
        [UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView: self.view cache: YES];
        [viewController3 viewWillAppear: YES];
        [viewController2 viewWillDisappear: YES];
        
        [viewController3.view removeFromSuperview];
        [self.view insertSubview: viewController2.view atIndex: 0];
        
        [viewController2 viewWillDisappear: YES];
        [viewController3 viewWillAppear: YES];
        UIBarBtnItmBack.enabled = NO;
    } 
    [UIView commitAnimations];
    UIBarBtnItmNext.enabled = YES;
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
    if (self.viewController2.view.superview == nil) {
        self.viewController2 = nil;
    } else if (self.viewController3.view.superview == nil) {
        self.viewController3 = nil;        
    } else if (self.viewController4.view.superview == nil) {
        self.viewController4 = nil;        
    } else if (self.viewController5.view.superview == nil) {
        self.viewController5 = nil;        
    } else if (self.viewController6.view.superview == nil) {
        self.viewController6 = nil;        
    }
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
    ViewController2 *Controller2 = [[ViewController2 alloc] initWithNibName: @"View2" bundle: nil];
    self.viewController2 = Controller2;
    [self.view insertSubview: Controller2.view atIndex: 0];
    [Controller2 release];
}


- (void)viewDidUnload
{
    UIBarBtnItmNext = nil;
    UIBarBtnItmBack = nil;
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
