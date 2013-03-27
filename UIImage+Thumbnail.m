//
//  UIImage+Thumbnail.m
//  CompanyKit
//
//  Created by Alsey Coleman Miller on 3/25/13.
//  Copyright (c) 2013 Webeo Games. All rights reserved.
//

#import "UIImage+Thumbnail.h"
#import <ImageIO/ImageIO.h>
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (Thumbnail)

-(UIImage *)makeThumbnailWithSize:(CGSize)size withCornerRadius:(float)radius
{
    CGSize originalSize = self.size;
    
    float ratio = MAX(size.width / originalSize.width, size.height / originalSize.width);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                                                    cornerRadius:radius];
    
    [path addClip];
    
    // center image
    CGRect projectRect;
    projectRect.size.width = ratio * originalSize.width;
    projectRect.size.height = ratio * originalSize.height;
    projectRect.origin.x = (size.width - projectRect.size.width) / 2;
    projectRect.origin.y = (size.height - projectRect.size.height) / 2;
    [self drawInRect:projectRect];
    
    // return the thumbnail
    UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
    return thumbnail;
}


@end
