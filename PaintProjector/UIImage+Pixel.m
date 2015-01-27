//
//  UIImage+Pixcel.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "UIImage+Pixel.h"


@implementation UIImage (Pixel)
-(UIColor*)pickPixelAtX:(NSUInteger)x Y:(NSUInteger)y{
    CGImageRef cgImage = [self CGImage];
    size_t width = CGImageGetWidth(cgImage);
    size_t height = CGImageGetHeight(cgImage);
    
    CGFloat r = (CGFloat) 255.0/255.0;
    CGFloat g = (CGFloat) 255.0/255.0;
    CGFloat b = (CGFloat) 255.0/255.0;
    CGFloat a = (CGFloat) 255.0/255.0;

    if ((x < width) && (y < height))
    {
        CGDataProviderRef provider = CGImageGetDataProvider(cgImage);
        CFDataRef bitmapData = CGDataProviderCopyData(provider);
        const UInt8* data = CFDataGetBytePtr(bitmapData);
        size_t offset = ((width * y) + x) * 4;
        b = (CGFloat)data[offset+0] / 255.0;
        g = (CGFloat)data[offset+1] / 255.0;
        r = (CGFloat)data[offset+2] / 255.0;
        a = (CGFloat)data[offset+3] / 255.0;
        CFRelease(bitmapData);
//        NSLog(@"R:%f G:%f B:%f A:%f",r,g,b,a);
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    else{
        return nil;
    }
}
@end
