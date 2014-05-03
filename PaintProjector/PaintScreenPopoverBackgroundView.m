//
//  PaintScreenPopoverBackgroundView.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PaintScreenPopoverBackgroundView.h"
#import "PaintUIKitStyle.h"
#import "SharedPopoverArrowView.h"

#define CONTENT_INSET 0
#define CAP_INSET 25.0
#define ARROW_BASE 22
#define ARROW_HEIGHT 5.0

@implementation PaintScreenPopoverBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _borderImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"popover-bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(CAP_INSET,CAP_INSET,CAP_INSET,CAP_INSET)]];
        
//        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popover-arrow.png"]];
        _arrowView = [[SharedPopoverArrowView alloc]initWithFrame:CGRectMake(0, 0, ARROW_BASE, ARROW_HEIGHT)];
        _arrowView.opaque = false;
        
        [self addSubview:_borderImageView];
        [self addSubview:_arrowView];
        
        self.opaque = false;
        self.alpha = 0.8;
        self.layer.shadowColor = [UIColor colorWithRed: 0.3 green: 0.28 blue: 0.28 alpha: 0.3].CGColor;

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}


- (CGFloat) arrowOffset {
    return _arrowOffset;
}

- (void) setArrowOffset:(CGFloat)arrowOffset {
    _arrowOffset = arrowOffset;
}

- (UIPopoverArrowDirection)arrowDirection {
    return _arrowDirection;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection {
    _arrowDirection = arrowDirection;
}


+(UIEdgeInsets)contentViewInsets{
    return UIEdgeInsetsMake(CONTENT_INSET, CONTENT_INSET, CONTENT_INSET, CONTENT_INSET);
}

+(CGFloat)arrowHeight{
    return ARROW_HEIGHT;
}

+(CGFloat)arrowBase{
    return ARROW_BASE;
}

-  (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat _height = self.frame.size.height;
    CGFloat _width = self.frame.size.width;
    CGFloat _left = 0.0;
    CGFloat _top = 0.0;
    CGFloat _coordinate = 0.0;
    CGAffineTransform _rotation = CGAffineTransformIdentity;
    
    
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
            _top += ARROW_HEIGHT;
            _height -= ARROW_HEIGHT;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            _arrowView.frame = CGRectMake(_coordinate, 0, ARROW_BASE, ARROW_HEIGHT);
            break;
            
            
        case UIPopoverArrowDirectionDown:
            _height -= ARROW_HEIGHT;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            _arrowView.frame = CGRectMake(_coordinate, _height, ARROW_BASE, ARROW_HEIGHT);
            _rotation = CGAffineTransformMakeRotation( M_PI );
            break;
            
        case UIPopoverArrowDirectionLeft:
            _left += ARROW_BASE;
            _width -= ARROW_BASE;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset) - (ARROW_HEIGHT/2);
            _arrowView.frame = CGRectMake(0, _coordinate, ARROW_BASE, ARROW_HEIGHT);
            _rotation = CGAffineTransformMakeRotation( -M_PI_2 );
            break;
            
        case UIPopoverArrowDirectionRight:
            _width -= ARROW_BASE;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset)- (ARROW_HEIGHT/2);
            _arrowView.frame = CGRectMake(_width, _coordinate, ARROW_BASE, ARROW_HEIGHT);
            _rotation = CGAffineTransformMakeRotation( M_PI_2 );
            
            break;
            
    }
    
    _borderImageView.frame =  CGRectMake(_left, _top, _width, _height);
    
    
    [_arrowView setTransform:_rotation];
    
}
@end
