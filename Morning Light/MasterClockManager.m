//
//  MasterClockManager.m
//  Morning Light
//
//  Created by Gelan Almagro on 5/2/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import "MasterClockManager.h"

@implementation MasterClockManager

@synthesize mastercolor;

static MasterClockManager* _sharedManager = nil;

+(id)alloc{
    @synchronized([MasterClockManager class])
    {
        NSAssert(_sharedManager == nil, @"second instance");
        _sharedManager = [super alloc];
        return _sharedManager;
    }
    return nil;
}


+(MasterClockManager*)sharedManager{
    @synchronized([MasterClockManager class])
    {
        if (!_sharedManager) {
            _sharedManager = [[self alloc] init];
        }
        
        return _sharedManager;
        
    }
    return nil;
}

-(id)init {
    self = [super init];
    if (self != nil) {
         mastercolor = [UIColor colorWithRed:0.7 green:0.2 blue:0.3 alpha:1.0];
        NSLog(@"master color manager initiated");
        
    }
    return self;
}

@end
