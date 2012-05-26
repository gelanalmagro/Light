//
//  ImageControl.h
//  UI Clock
//
//  Created by Gelan Almagro on 4/19/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


@interface ImageControl : NSObject

-(UIImage*)getImageNegativeImage:(UIImage*)image2;
-(UIImage*)getImageBlended:(UIImage*)image blendingMode:(CGBlendMode)bleding withAlpha:(float)alpha andColor:(UIColor*)color;
-(UIImage*)getImagefromblendedImages:(UIImage*)imageTop andImage:(UIImage*)imagebot withBlendingmode:(CGBlendMode)blendingMode;

@end
