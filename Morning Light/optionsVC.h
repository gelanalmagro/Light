//
//  optionsVC.h
//  Morning Light
//
//  Created by Gelan Almagro on 5/1/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockRotationProtocol.h"
#import "ClockVC.h"
#import "MasterClockManager.h"


@interface optionsVC : UIViewController{
    
    float r,g,b;
    
}
@property(weak)id <clocktimingandimage> delegate;
@property(strong)UIColor *clockcolor;
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) IBOutlet UIView *color;
@property (strong, nonatomic) IBOutlet UIButton *colorset;

- (IBAction)colorsetAction:(id)sender;
- (IBAction)redSliderchanged:(id)sender;
- (IBAction)greeSliderchanged:(id)sender;
- (IBAction)bluSliderchanged:(id)sender;

@end
