//
//  BrushTypeView.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "ADBrushTypeScrollView.h"

#define ButtonWidth 66
#define ButtonHeight 100

@implementation ADBrushTypeScrollView

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

//- (void)setContentOffset:(CGPoint)contentOffset{
//    
//    super.contentOffset = contentOffset;
//}
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
-(void)addBrushType:(ADBrush*)brush{
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
    

    float width = (float)self.bounds.size.width / (CGFloat)numOfBrush;
    float offsetX = (width - ButtonWidth) * 0.5;
    for (int i = 0; i < [self.brushTypes count]; ++i) {
        ADBrushTypeButton * button = [[ADBrushTypeButton alloc] initWithFrame:CGRectMake(width*i + offsetX, 20, ButtonWidth, ButtonHeight)];
        button.brush = self.brushTypes[i];
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

- (void)autoShowBrushesTimerFired:(id)sender{
    NSInteger page = self.brushTypePageControl.currentPage;

    if ((page + 1) >= self.brushTypePageControl.numberOfPages) {
        self.brushTypePageControl.currentPage = 0;
    }
    else{
        self.brushTypePageControl.currentPage = page + 1;
    }
    DebugLogFuncStart(@"autoShowBrushesTimerFired currentPage %d", self.brushTypePageControl.currentPage);
    [self setContentOffset:CGPointMake(self.brushTypePageControl.currentPage * self.frame.size.width, 0) animated:true];
}
@end
