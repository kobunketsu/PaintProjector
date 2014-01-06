//
//  ClearGestureRecognizer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-30.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface ClearGestureRecognizer : UIGestureRecognizer
{
    
}
@property(nonatomic, assign) UITouch *touch;
@property(nonatomic, assign) NSInteger reverseCount;    //转折点次数
@property(nonatomic, assign) CGPoint prevDirection;     //上个移动方向
@property(nonatomic, assign) NSInteger toucheCount;
@property(nonatomic, assign) bool firstCheck;
@property(nonatomic, assign) float timeInterval;//自定义时间间隔
@property(nonatomic, assign) float prevTimeStamp;//自定义上个时间点
@property(nonatomic, assign) CGPoint prevPoint; //自定义时间间隔的上一次监测位置
@end
