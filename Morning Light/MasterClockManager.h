//
//  MasterClockManager.h
//  Morning Light
//
//  Created by Gelan Almagro on 5/2/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MasterClockManager : NSObject

+(MasterClockManager*)sharedManager;
+(id)alloc;


@property(nonatomic, strong)UIColor *mastercolor;

@end
