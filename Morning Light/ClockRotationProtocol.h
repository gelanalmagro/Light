//
//  ClockRotationProtocol.h
//  UI Clock
//
//  Created by Gelan Almagro on 4/17/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    clocktypeThin,
    clocktypeThick,
    clocktypethinDigital,
    clocktypeThickDigital,
}ClockType;


@protocol clocktimingandimage

-(void)ClockTimehasChanged:(int)timeoftheClock;
-(void)changeBackgroundto:(int)backgroundNumber;
-(void)dimthelights;
-(void)changeTheClockto:(ClockType)typeofClock;
-(void)startthesunrise:(float)brightness;
-(void)changeClockColorto:(UIColor*)color;
-(UIColor*)getthecolor;


@end