//
//  optionsVC.m
//  Morning Light
//
//  Created by Gelan Almagro on 5/1/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import "optionsVC.h"

@interface optionsVC ()

@end

@implementation optionsVC

@synthesize clockcolor;
@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;
@synthesize color;
@synthesize colorset;
@synthesize delegate;

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
    
        //UIColor *colored = [self.delegate getthecolor];
        clockcolor = [MasterClockManager sharedManager].mastercolor;

        //color.backgroundColor = colored;
    const CGFloat* components = CGColorGetComponents(clockcolor.CGColor);
    
    greenSlider.value = components[1];
    redSlider.value = components[0];
    blueSlider.value = components[2];
    g = components[1];
    r = components[0];
    b = components[2];
    
        color.backgroundColor = clockcolor;
    
}
-(void)viewDidUnload{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [self setColor:nil];
    [self setColorset:nil];
    [self setRedSlider:nil];
    [self setBlueSlider:nil];
    [self setGreenSlider:nil];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


- (IBAction)colorsetAction:(id)sender {
    NSLog(@"touching set color");
    [self.delegate changeClockColorto:clockcolor];
}

- (IBAction)redSliderchanged:(UISlider *)sender {
    
    r = [sender value];
    color.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    clockcolor = color.backgroundColor;
        //[[MasterClockManager sharedManager] setMastercolor:clockcolor];

}

- (IBAction)greeSliderchanged:(UISlider *)sender {
    g = [sender value];

    color.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    clockcolor = color.backgroundColor;
        //[[MasterClockManager sharedManager] setMastercolor:clockcolor];

}

- (IBAction)bluSliderchanged:(UISlider *)sender {
    b = [sender value];

    color.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    clockcolor = color.backgroundColor;
        //[[MasterClockManager sharedManager] setMastercolor:clockcolor];

}


@end
