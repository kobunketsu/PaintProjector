//
//  UndoGestureRecognizer.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-5.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UndoGestureRecognizer : UIPanGestureRecognizer
{
    BOOL _isUndoPredicted;
}
- (BOOL)isUndo:(UITouch*)touch;
//- (void)predictIsUndo:(UITouch*)touch;
@end
