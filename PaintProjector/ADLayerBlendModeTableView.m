//
//  LayerBlendModeTableView.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerBlendModeTableView.h"
#import "ADLayerBlendModePopoverController.h"
@implementation ADLayerBlendModeTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    for (UITableViewCell *cell in self.visibleCells) {
        if (CGRectContainsPoint(cell.frame, touchPoint)) {
            NSIndexPath *newIndexPath = [self indexPathForCell:cell];
            [self selectRowAtIndexPath:newIndexPath animated:true scrollPosition:UITableViewScrollPositionNone];
            [self.controller willSelectRowAtIndexPath:newIndexPath];
            return;
        }
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    DebugLog(@"touchesMoved!");
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];

    for (int i = 0; i < self.visibleCells.count; ++i) {
        UITableViewCell *cell = [self.visibleCells objectAtIndex:i];
        if (CGRectContainsPoint(cell.frame, touchPoint)) {
//            DebugLog(@"touchPoint in cell %@", cell.textLabel.text);
            NSIndexPath *oldIndexPath = [self indexPathForSelectedRow];
            NSIndexPath *newIndexPath = [self indexPathForCell:cell];
            if (oldIndexPath.row != newIndexPath.row) {
                DebugLog(@"select row in cell %d", cell.tag);
                
                [self selectRowAtIndexPath:newIndexPath animated:true scrollPosition:UITableViewScrollPositionNone];
                [self.controller willSelectRowAtIndexPath:newIndexPath];
            }
            return;
        }
    }
}

//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSIndexPath *newIndexPath = [self indexPathForSelectedRow];
//    [self selectRowAtIndexPath:newIndexPath animated:true scrollPosition:UITableViewScrollPositionNone];
//}
@end
