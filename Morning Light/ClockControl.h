//
//  ClockControl.h
//  UI Clock
//
//  Created by Gelan Almagro on 4/17/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockRotationProtocol.h"
#import <QuartzCore/QuartzCore.h>
#import "ClockRotationProtocol.h"
#import "ImageControl.h"



@interface ClockControl : UIView{
    UILabel *label;
    BOOL sunrise;
    float counter;
    UIImage *shortArmIm;
    UIImage *imageclock;
    UIImage *image2;
    UIImage *image3;
    UIImageView *secondArm;
    UIImageView *longArm;
    UIImageView *shortArm;
    
    
}


@property(weak)id <clocktimingandimage> delegate;

@property(nonatomic, strong)UIView *container_Seconds;
@property(nonatomic, strong)UIView *container_Minutes;
@property(nonatomic, strong)UIView *container_Hours;
@property(nonatomic, strong)UIView *container_SecondsShadow;
@property(nonatomic, strong)UIView *container_MinutesShadow;
@property(nonatomic, strong)UIView *container_HoursShadow;
@property(nonatomic, strong)UIImageView *clock;
@property(nonatomic)ClockType _clocktype;
@property(nonatomic, strong)ImageControl *imageCreate;
@property(nonatomic, strong)    UILabel *label;



- (id)initWithFrame:(CGRect)frame anddelegate:(id)del withcolor:(UIColor*)color andBlending:(CGBlendMode)blendmode typeofClock:(ClockType)typ;
-(void)rotateClock_Hours:(int)h minutes:(int)m seconds:(int)s;
-(void)getClocktime;
-(void)changeclock:(UIInterfaceOrientation)deviceorientation;
-(void)clockColor:(UIColor*)color;

-(void)drawArmsWithcolor:(UIColor*)color andBlending:(CGBlendMode)blendmode;


@end
