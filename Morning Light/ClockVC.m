//
//  ClockVC.m
//  Morning Light
//
//  Created by Gelan Almagro on 5/1/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import "ClockVC.h"

@interface ClockVC ()

@end

@implementation ClockVC


@synthesize clock;
@synthesize clockcolor;
@synthesize clocktimeset;
@synthesize armShadow;
@synthesize backview;
@synthesize arm; // new change
@synthesize imagecreate;
@synthesize clGearB;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIColor *color = [MasterClockManager sharedManager].mastercolor;
        
            clockcolor = color;
            //clockcolor = color;

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    imagecreate = [[ImageControl alloc] init];
    clockcolor = [MasterClockManager sharedManager].mastercolor;
    NSLog(@"size = %f,%f,%f,%f",self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height);
    NSLog(@"size = %f,%f,%f,%f",self.view.bounds.origin.x,self.view.bounds.origin.y,self.view.bounds.size.width,self.view.bounds.size.height);
    self.view.userInteractionEnabled    = YES;
        //[self.view setFrame:[UIWindow 
    
    [[UIScreen mainScreen]setBrightness:0.5];
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    imagecreate = [[ImageControl alloc] init];
    [super viewDidLoad];
    
    UIImage *backgroundsun = [UIImage imageNamed:@"sunrise.jpg"];
    backview = [[UIImageView alloc] initWithImage:backgroundsun];
    backview.alpha = 0.0f;
    [self.view addSubview:backview];
    
        // clock.image = [imagecontrol getImageNegativeImage:image2];
    
    
    /*
     armShadow = [[ClockControl alloc] initWithFrame:CGRectMake(1, 1, self.view.frame.size.width + 1, self.view.frame.size.height + 1) anddelegate:self withcolor:[UIColor grayColor] andBlending:kCGBlendModeMultiply];
     armShadow.layer.shadowColor = [UIColor redColor].CGColor;
     armShadow.layer.shadowRadius = 2.0;
     armShadow.layer.shadowOpacity = 1.0;
     armShadow.layer.shadowOffset = CGSizeMake(2, 2);
     
     [self.view addSubview:armShadow];
     */
    
    
    
    
        //UIColor *color = [UIColor colorWithRed:0.1 green:0.2 blue:0.3 alpha:1.0];
    
    UIView *empty = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:empty];
    
    
    arm = [[ClockControl alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) anddelegate:self withcolor:clockcolor andBlending:kCGBlendModeNormal typeofClock:clocktypeThin];
    arm.layer.shadowColor = [UIColor blackColor].CGColor;
    arm.layer.shadowRadius = 2.0;
    arm.layer.shadowOpacity = 1.0;
    arm.layer.shadowOffset = CGSizeMake(2, 2);
    arm.delegate = self;
    [self.view addSubview:arm];
    
    [self.view addSubview:clGearB];
}

- (void)viewDidUnload
{
    [self setClGearB:nil];
    [self setClocktimeset:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)colorClockwith:(UIColor *)color{
    [arm clockColor:color];
    clockcolor = color;
    [[MasterClockManager sharedManager] setMastercolor:color];
    NSLog(@"setting the color 1 ");
    
    

}
-(void)changeTheClockto:(ClockType)typeofClock{
    
}
-(void)dimthelights{
    
}
-(void)startthesunrise:(float)brightness{
    [[UIScreen mainScreen] setBrightness:brightness];
    backview.alpha = brightness;
    
}

-(void)changeBackgroundto:(int)backgroundNumber{
    NSLog(@"delegate touch");
    NSString *string = [[NSString alloc] initWithFormat:@"back_0%i",backgroundNumber ];
    UIImage *image = [UIImage imageNamed:string];
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:image];
    
}
-(void)ClockTimehasChanged:(int)timeoftheClock{
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    arm.layer.shadowColor = [UIColor clearColor].CGColor;
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    arm.layer.shadowColor = [UIColor blackColor].CGColor;
}
-(void)changeClockColorto:(UIColor *)color{
    [arm clockColor:color];
    clockcolor = color;
    [[MasterClockManager sharedManager] setMastercolor:color];
    
    NSLog(@"drea arms and color");
}
-(UIColor*)getthecolor{
    NSLog(@"getting the color fot pupover");
    
    return clockcolor;
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    UIInterfaceOrientation toOrientation = self.interfaceOrientation;
    
    
	
	if(toOrientation == UIInterfaceOrientationPortrait || toOrientation == UIInterfaceOrientationPortraitUpsideDown){
        
        arm.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);// new change
        [arm changeclock:toOrientation];                                                                                      //armShadow.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);// new change
        
	}else{
        arm.center = CGPointMake(self.view.frame.size.height/2, self.view.frame.size.width/2);// new change
        [arm changeclock:toOrientation];                                                                                      //armShadow.center = CGPointMake(self.view.frame.size.height/2, self.view.frame.size.width/2);// new change
        
	}
}



- (IBAction)clGearAction:(id)sender {
    NSLog(@"touch inside");
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"popthecolors"]){
        optionsVC *cvc = (optionsVC *)[segue destinationViewController];
        cvc.clockcolor = self.clockcolor;
        cvc.delegate = self;
    }
}


@end
