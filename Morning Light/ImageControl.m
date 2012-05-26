//
//  ImageControl.m
//  UI Clock
//
//  Created by Gelan Almagro on 4/19/12.
//  Copyright (c) 2012 OcasoStudios. All rights reserved.
//

#import "ImageControl.h"

@implementation ImageControl

-(id)init{
    if (self == [super init]) {
         
    }
    return self;
}

-(UIImage*)getImageNegativeImage:(UIImage *)image2{
    
    
    
    
    return image2;
    
}

-(UIImage*)getImageBlended:(UIImage *)image blendingMode:(CGBlendMode)bleding withAlpha:(float)alpha andColor:(UIColor *)color{
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 2);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeCopy);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, image.size.height);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), bleding);
    CGContextClipToMask(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(),color.CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, image.size.width+4, image.size.height+4));
    UIImage * result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

-(UIImage*)getImagefromblendedImages:(UIImage *)imageTop andImage:(UIImage *)imagebot withBlendingmode:(CGBlendMode)blendingMode{
    
    UIGraphicsBeginImageContext( imageTop.size );
    [imagebot drawInRect:CGRectMake(0, 0, imagebot.size.width, imagebot.size.height)];
    [imageTop drawInRect:CGRectMake(0, 0, imageTop.size.width, imageTop.size.height) blendMode:blendingMode alpha:1.0];

    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return returnImage;
    
}

@end
