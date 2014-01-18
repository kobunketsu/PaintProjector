//
//  BrushTypeView.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "BrushTypeScrollView.h"

@implementation BrushTypeScrollView

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
        super.delegate = self;
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
-(void)destroy
{
    [self.brushTypes removeAllObjects];
    self.brushTypes = nil;
}
-(void)addBrushType:(Brush*)brush{
    brush.brushState.classId = [self.brushTypes count];
    [self.brushTypes addObject:brush];
//    DebugLog(@"[ addBrushType brushId: %d ]", brush.brushState.classId);
}

-(void)initSubviewsWithNumOfBrushPerPage:(NSInteger)numOfBrush{
    //    float frameBase = 0;
    //    for (UIView* view in self.superview.subviews) {
    //        if(view.tag == 1){//找到brush view
    //            frameBase = view.frame.origin.y;
    //        }
    //    }
    
    //自动使配改为固定大小
    //    float frameHeight = self.frame.size.width * [_brushTypes count];
    //    self.frame = CGRectMake(self.frame.origin.x, frameBase - frameHeight, self.frame.size.width, frameHeight);
    
    float buttonWidth = 66;
    float buttonHeight = 100;
    float width = (float)self.bounds.size.width / (CGFloat)numOfBrush;
    float offsetX = (width - 66) * 0.5;
    for (int i = 0; i < [self.brushTypes count]; ++i) {
        BrushTypeButton * button = [[BrushTypeButton alloc] initWithFrame:CGRectMake(width*i + offsetX, 20, buttonWidth, buttonHeight)];
        button.brush = [self.brushTypes objectAtIndex:i];
        //        [button setImage:brush.iconImage forState:UIControlStateNormal];
        //        [button setBackgroundColor:[UIColor whiteColor]];
        
        [button addTarget:self.delegate action:@selector(willSelectBrush:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self.delegate action:@selector(willSelectBrushDone:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self.delegate action:@selector(willSelectBrushCanceled:) forControlEvents:UIControlEventTouchUpOutside];
        [button addTarget:self.delegate action:@selector(willSelectBrushCanceled:) forControlEvents:UIControlEventTouchCancel];
        
        button.isAccessibilityElement = true;
        NSString *brushName = NSStringFromClass([button.brush class]);
        button.accessibilityLabel = brushName;
        [self addSubview:button];
    }
    
    self.contentSize = CGSizeMake(width * self.brushTypes.count, self.bounds.size.height);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    DebugLog(@"scrollViewDidScroll");
    
    [self.delegate willBrushTypeScrollViewDidScroll:scrollView];
}
@end
