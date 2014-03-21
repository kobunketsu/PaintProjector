//
//  LayerDelegate.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-5.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface LayerDelegate : NSObject {
    UIView* _view; // weak reference
}
-(id) initWithView: (UIView*) view;
- (CALayer*)addLayerWithName:(NSString*)name Contents:(id)contents InRect:(CGRect)rect;
-(void)copyLayerInfo:(CALayer*)srcLayer ToLayer:(CALayer*)targetLayer;
@end
