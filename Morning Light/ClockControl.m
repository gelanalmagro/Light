//
//  ClockControl.m
//  UI Clock
//
//  Created by Gelan Almagro on 4/17/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import "ClockControl.h"

@interface ClockControl()
-(void)drawDigitalClock;

@end

@implementation ClockControl{
    UIButton *button;
}

@synthesize delegate;
@synthesize clock;
@synthesize container_Hours;
@synthesize container_Minutes;
@synthesize container_Seconds;
@synthesize container_HoursShadow;
@synthesize container_MinutesShadow;
@synthesize container_SecondsShadow;
@synthesize _clocktype;
@synthesize imageCreate;
@synthesize label;



- (id)initWithFrame:(CGRect)frame anddelegate:(id)del withcolor:(UIColor*)color andBlending:(CGBlendMode)blendmode  typeofClock:(ClockType)typ
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        imageCreate = [[ImageControl alloc] init];
        self._clocktype = typ;
        sunrise = NO;
        counter = 0.0f;
        self.userInteractionEnabled = YES;
        if (typ == clocktypethinDigital || typ == clocktypeThickDigital) {
            [self drawDigitalClock];
        } else [self drawArmsWithcolor:color andBlending:blendmode];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(getClocktime) userInfo:nil repeats:YES];
        
    }
    return self;
}

-(void)drawDigitalClock{
    
}

-(void)drawArmsWithcolor:(UIColor*)color andBlending:(CGBlendMode)blendmode{
    
    
    
    float secondAnchoroffset;
    NSString*clockString;
    NSString* nameofFileaddon;
    switch (self._clocktype) {
        case clocktypeThin:
            nameofFileaddon = [NSString stringWithString:@"thin"];
            secondAnchoroffset = 0.0f;
            break;
        
        case clocktypeThick:
            nameofFileaddon = [NSString stringWithString:@"thick"];
            secondAnchoroffset = 6.4355;
            break;

        default:
            break;
    }
    clockString = [[NSString alloc] initWithFormat:@"clClock%@.png",nameofFileaddon];
    
    imageclock = [UIImage imageNamed:@"clClockThin.png"];
    
    UIImage *clockresult = [imageCreate getImageBlended:imageclock blendingMode:blendmode withAlpha:1.0 andColor:color];
    
    

       
    // draw the Short Arm
    container_Hours = [[UIView alloc] initWithFrame:self.frame];
    
    shortArmIm = [UIImage imageNamed:@"clShortArmThin.png"];
    
    UIImage * result1 = [imageCreate getImageBlended:shortArmIm blendingMode:blendmode withAlpha:1.0 andColor:color];
    
    shortArm = [[UIImageView alloc] initWithImage:result1];
    float pivot = (1 -  (shortArmIm.size.width/2/shortArmIm.size.height ));
    shortArm.layer.anchorPoint = CGPointMake(0.5f, pivot);
    shortArm.layer.position = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    [container_Hours addSubview:shortArm];
    
        //draw the Long Arm
    container_Minutes = [[UIView alloc] initWithFrame:self.frame];
    image2 = [UIImage imageNamed:@"clLongArmThin.png"];
    
    UIImage * result = [imageCreate getImageBlended:image2 blendingMode:blendmode withAlpha:1.0 andColor:color];
    
    longArm = [[UIImageView alloc] initWithImage:result];
    pivot = (1 -  (image2.size.width/2/image2.size.height ));
    longArm.layer.anchorPoint = CGPointMake(0.5f, pivot);
    longArm.layer.position = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    [container_Minutes addSubview:longArm];
    
        //draw the second circle
    container_Seconds = [[UIView alloc] initWithFrame:self.frame];
    
    image3 = [UIImage imageNamed:@"clSecondThin.png"];

    UIImage * result2 = [imageCreate getImageBlended:image3 blendingMode:blendmode withAlpha:1.0 andColor:[UIColor redColor]];
   
    secondArm = [[UIImageView alloc] initWithImage:result2];
    pivot = (1 -  (image3.size.width/2/image3.size.height ));
    secondArm.layer.anchorPoint = CGPointMake(0.5f, pivot);//6.45
    secondArm.layer.position = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    [container_Seconds addSubview:secondArm];
    

        //container_Minutes.alpha = 0.5;
        //container_Hours.alpha = 0.5;
        //container_Seconds.alpha = 0.5;
    
    [self addSubview:container_Minutes];
    [self addSubview:container_Hours];
    [self addSubview:container_Seconds];

    clock = [[UIImageView alloc] initWithImage:clockresult];
    clock.layer.position = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    [self addSubview:clock];
    
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 600, 100)];
    label.backgroundColor = [UIColor clearColor];
    label.userInteractionEnabled = YES;
    
    label.font = [UIFont boldSystemFontOfSize:60];
    label.textColor = color;
    label.textAlignment = UITextAlignmentCenter;
    label.layer.position = CGPointMake(16, self.bounds.size.height - 200);
        
    [self addSubview:label];
                     
}



- (void)tapAction{
    
    
    NSLog(@"tap performed ");
}

-(void)clockColor:(UIColor *)color{
    
    label.textColor = color;
    secondArm.image = [imageCreate getImageBlended:secondArm.image blendingMode:kCGBlendModeNormal withAlpha:1.0 andColor:color];
    longArm.image = [imageCreate getImageBlended:longArm.image blendingMode:kCGBlendModeNormal withAlpha:1.0 andColor:color];
    shortArm.image = [imageCreate getImageBlended:shortArm.image blendingMode:kCGBlendModeNormal withAlpha:1.0 andColor:color];
    clock.image = [imageCreate getImageBlended:clock.image blendingMode:kCGBlendModeNormal withAlpha:1.0 andColor:color];


}

-(void)rotateClock_Hours:(int)h minutes:(int)m seconds:(int)s{
    
       
    CGFloat anglefromtimeS = (2 * M_PI/60) * s;
    container_Seconds.transform = CGAffineTransformMakeRotation(anglefromtimeS);
    container_SecondsShadow.transform = CGAffineTransformMakeRotation(anglefromtimeS);

    CGFloat anglefromtimeM = (2 * M_PI/60) * m;
    container_Minutes.transform = CGAffineTransformMakeRotation(anglefromtimeM);
    container_MinutesShadow.transform = CGAffineTransformMakeRotation(anglefromtimeM);

        // move the Hour depending on the minute
    if (h > 12) {
        h = h - 12;
    }
    h = (h * 5 ) + 5 * m / 60;
    CGFloat anglefromtimeH = (2 * M_PI/60) * h;
    container_Hours.transform = CGAffineTransformMakeRotation(anglefromtimeH);
    container_HoursShadow.transform = CGAffineTransformMakeRotation(anglefromtimeH);

}


-(void)getClocktime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"HH"];
    int hour = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    
    [dateFormatter setDateFormat:@"mm"];
    int minute = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    
    [dateFormatter setDateFormat:@"ss"];
    int second = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    NSString *pmam = [[NSString alloc] initWithString:@"am"];
        //NSLog(@"%i",hour);
    
    if (hour == 6 && minute > 30 && !sunrise) {
        counter = counter + 1.0f;
        float sunriseF = counter/(15.0f*60.0f*60.0f);
            //NSLog(@"%f",sunriseF);
        
        if (sunriseF > 1) {
            sunriseF = 1.0f;
            counter = counter - 1.0f;
            sunrise = YES;
        }
        [self.delegate startthesunrise:sunriseF];
        
    } else sunrise = NO;
    
    if (hour > 12) {
        hour = hour - 12;
        pmam = [NSString stringWithString:@"pm"];
    }
    if (minute < 10) {
        
        label.text = [NSString stringWithFormat:@"%i:0%i %@",hour,minute,pmam];
            //label.text = [NSString stringWithFormat:@"%i:0%i %@",hour,minute,pmam];

    } else {
        label.text = [NSString stringWithFormat:@"%i:%i %@",hour,minute,pmam];

            //label.text = [NSString stringWithFormat:@"%i:%i %@",hour,minute,pmam];
    }
    
    [self rotateClock_Hours:hour minutes:minute seconds:second];
    
    
    
}
-(void)changeclock:(UIInterfaceOrientation)deviceorientation{
    
    
    if(deviceorientation == UIInterfaceOrientationPortrait || deviceorientation == UIInterfaceOrientationPortraitUpsideDown){
		
        label.layer.position = CGPointMake(self.frame.size.width/2, self.bounds.size.height - 100);

        NSLog(@"hahahahahside");
        
	}else{
		
        label.layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height - 300);

        NSLog(@"hahahahah up");

        
	}
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if (CGRectContainsPoint([self.label frame], [touch locationInView:self]))
    {
        NSLog(@"touched inside label");
        
    } else {
        
        NSLog(@"touching i-----------------------nside%f,%f",[touch locationInView:self].x,[touch locationInView:self].y);
        float brigtness = [touch locationInView:self].y/self.frame.size.height;
        [[UIScreen mainScreen]setBrightness:brigtness];

    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"tap performed");
    
    UITouch *touch = [[event allTouches] anyObject];
    if (!CGRectContainsPoint([self.label frame], [touch locationInView:self]))
    {
        NSLog(@"touching insi-----------------de%f,%f",[touch locationInView:self].x,[touch locationInView:self].y);
        float brigtness = [touch locationInView:self].y/self.frame.size.height;
        [[UIScreen mainScreen]setBrightness:brigtness];

    }

        
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if (CGRectContainsPoint([self.label frame], [touch locationInView:self]))
    {
        NSLog(@"touched inside label");
        
    }
}




@end
