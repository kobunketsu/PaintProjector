//
//  BrushTypeView.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "BrushTypeView.h"

@implementation BrushTypeView
@synthesize brushTypes = _brushTypes;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        _brushTypes = [[NSMutableArray alloc]init];
    }
    return self;    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)addBrushType:(Brush*)brush{
    brush.brushState.brushId = [_brushTypes count];
    [_brushTypes addObject:brush];
}

-(void)layoutSubviews{
    float frameBase = 0;
    for (UIView* view in self.superview.subviews) {
        if(view.tag == 1){//找到brush view
            frameBase = view.frame.origin.y;
        }
    }
    
    //自动使配改为固定大小
//    float frameHeight = self.frame.size.width * [_brushTypes count];
//    self.frame = CGRectMake(self.frame.origin.x, frameBase - frameHeight, self.frame.size.width, frameHeight);

    float buttonWidth = self.frame.size.width;
    for (int i = 0; i < [_brushTypes count]; ++i) {
        BrushTypeButton * button = [[BrushTypeButton alloc] initWithFrame:CGRectMake(0, buttonWidth*i, buttonWidth, buttonWidth)];
        Brush* brush = [_brushTypes objectAtIndex:i];
        button.brush = brush;
        [button setImage:brush.iconImage forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:delegate action:@selector(selectBrush:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];        
    }
}
@end
