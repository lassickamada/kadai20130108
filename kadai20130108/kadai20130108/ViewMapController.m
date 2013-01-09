//
//  ViewMapController.m
//  kadai20130108
//
//  Created by 釜田 裕介 on 2013/01/09.
//  Copyright (c) 2013年 釜田 裕介. All rights reserved.
//

#import "ViewMapController.h"

@interface ViewMapController ()

@end

@implementation ViewMapController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"viewDidLoadMap");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)MapViewButton:(id)sender {
    //    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 400, 550)];
    //    textView.textAlignment = UITextAlignmentCenter;
    //    textView.font = [UIFont fontWithName:@"Arial" size:24.0f];
    //    textView.backgroundColor = [UIColor clearColor];
    //    [self.view addSubview:textView];
    
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(10, 70, 300, 300)];
    mapView.mapType = MKMapTypeStandard;
    CLLocationCoordinate2D coord = {latitude: 35.441287, longitude:134.260164};
    MKCoordinateSpan span = {latitudeDelta: 0.002, longitudeDelta: 0.002};
    MKCoordinateRegion region = {coord,span};
    [mapView setRegion:region];
    [self.view addSubview:mapView];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    // この間で、座標移動、変形等を行うと座標移動、変形がアニメーションでスムーズに行われる。
    [UIView commitAnimations];
    
//    [textView release];
//    [mapView release];
}

@end
