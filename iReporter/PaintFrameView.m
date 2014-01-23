//
//  PaintFrameButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PaintFrameView.h"
#import "Ultility.h"
#import "TextureManager.h"
@implementation PaintFrameView

- (id)initWithCoder:(NSCoder *)aDecoder{
//    DebugLog(@"[initWithCoder]");
    self = [super initWithCoder:aDecoder];
    if (self) {
//        self.clipsToBounds = YES;
//        self.opaque = NO;
//        self.alpha = 0.9;
//        self.backgroundColor = [UIColor darkGrayColor];
//        
//        self.layer.cornerRadius = 10;
//        self.layer.shadowRadius = 3.0;
//        self.layer.shadowOpacity = 0.8;
//        self.layer.shadowOffset = CGSizeMake(0, 5);
//        self.layer.shadowColor = [UIColor blackColor].CGColor;
//        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
//        self.layer.shadowPath = path.CGPath;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
//    DebugLog(@"[initWithFrame]");
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = false;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
        //        self.opaque = NO;
        //        self.alpha = 0.9;
    }
    return self;
}

//-(void)awakeFromNib{
//
//}


- (id)initWithFrame:(CGRect)frame paintDoc:(PaintDoc*)paintDoc{
    self = [super initWithFrame:frame];
    if (self !=nil) {
        _paintDoc = paintDoc;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    //// General Declarations
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //// Shadow Declarations
//    UIColor* shadow = [UIColor blackColor];
//    CGSize shadowOffset = CGSizeMake(2.1, -2.1);
//    CGFloat shadowBlurRadius = 5;
//    
//    //// Group
//    {
//        CGContextSaveGState(context);
//        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
//        
//        CGContextBeginTransparencyLayer(context, NULL);
//        
//        
//        //// Rectangle Drawing
//        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 240, 320) cornerRadius: 10];
//        [[UIColor whiteColor] setFill];
//        [rectanglePath fill];
//        [[UIColor blackColor] setStroke];
//        rectanglePath.lineWidth = 1;
//        [rectanglePath stroke];
//        
//        
//        CGContextEndTransparencyLayer(context);
//        CGContextRestoreGState(context);
//    }
//    
//    
//    
//}

-(void)setPaintDoc:(PaintDoc *)paintDoc{
    _paintDoc = paintDoc;

    NSUInteger length = [paintDoc.docPath length];
    NSString *accLabel = [paintDoc.docPath substringToIndex:(length - 4)];
    self.isAccessibilityElement = true;
    self.accessibilityLabel = accLabel;
}

-(void)loadForDisplay{
    //清楚前一张画面
//    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.alpha = 0;
//    } completion:^(BOOL finished) {
//        if (self.paintDoc != NULL)
//        {
//            NSString *thumbImagePath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:self.paintDoc.thumbImagePath];
//            [self setImage:[UIImage imageWithContentsOfFile:thumbImagePath] forState:UIControlStateNormal];
//            
//            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                self.alpha = 1;
//            }completion:^(BOOL finished) {
//            }];
//        }
//    }];
    
    if (self.paintDoc != NULL)
    {
        NSString *thumbImagePath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:self.paintDoc.thumbImagePath];

        [self setImage:[UIImage imageWithContentsOfFile:thumbImagePath] forState:UIControlStateNormal];
//    DebugLog(@"DocThumbImage: %@", paintFrameView.paintDoc.thumbImagePath);        
    }

}
@end
