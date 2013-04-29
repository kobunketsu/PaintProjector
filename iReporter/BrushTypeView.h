//
//  BrushTypeView.h
//  iReporter
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import "Brush.h"
#import "BrushTypeButton.h"
@protocol BrushTypeViewDelegate <NSObject>
-(void)selectBrush:(id)sender;
@end
@interface BrushTypeView : UIView
{
    NSMutableArray *_brushTypes;
//    NSMutableDictionary *_brushTypes;
}
@property (assign, nonatomic) id<BrushTypeViewDelegate> delegate;
@property(nonatomic, retain)NSMutableArray *brushTypes;
-(void)addBrushType:(Brush*)brush;
@end
