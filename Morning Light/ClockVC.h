//
//  ClockVC.h
//  Morning Light
//
//  Created by Gelan Almagro on 5/1/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockControl.h"
#import "ImageControl.h"
#import "optionsVC.h"
#import "MasterClockManager.h"


@interface ClockVC : UIViewController <clocktimingandimage>

@property(nonatomic, strong) UIImageView* clock;
@property(nonatomic, strong)ClockControl *arm;// new change
@property(nonatomic, strong)ClockControl *armShadow;
@property(nonatomic, strong)UIImageView *backview;
@property(nonatomic, strong)ImageControl *imagecreate;
@property (strong, nonatomic) IBOutlet UIButton *clGearB;
@property(strong)UIColor *clockcolor;
@property (strong, nonatomic) IBOutlet UIButton *clocktimeset;

- (IBAction)clGearAction:(id)sender;

@end
