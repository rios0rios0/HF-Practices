//
//  CapturedPhotoViewController.h
//  iBountyHunter
//
//  Created by Felipe Rios on 31/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CapturedPhotoViewController : UIViewController 
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate> {
    UIImageView *fugitiveImage;
    Fugitive *fugitive;
    MKMapView *fugitiveMapView;
}

@property (nonatomic, retain) IBOutlet UIImageView *fugitiveImage;
@property (nonatomic, retain) Fugitive *fugitive;
@property (nonatomic, retain) IBOutlet MKMapView *fugitiveMapView;

- (IBAction)DoneButtonPressed:(id)sender;
- (IBAction)TakePictureButton:(id)sender;

@end
