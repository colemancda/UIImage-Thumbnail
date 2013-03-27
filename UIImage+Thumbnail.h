//
//  UIImage+Thumbnail.h
//  CompanyKit
//
//  Created by Alsey Coleman Miller on 3/25/13.
//  Copyright (c) 2013 Webeo Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Thumbnail)

-(UIImage *)makeThumbnailWithSize:(CGSize)size withCornerRadius:(float)radius;

@end
