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
@property (assign, nonatomic) UITouch *touch;
@property (assign, nonatomic) NSInteger reverseCount;    //转折点次数
@property (assign, nonatomic) CGPoint prevDirection;     //上个移动方向
@property (assign, nonatomic) NSInteger toucheCount;
@property (assign, nonatomic) bool firstCheck;
@property (assign, nonatomic) float timeInterval;//自定义时间间隔
@property (assign, nonatomic) float prevTimeStamp;//自定义上个时间点
@property (assign, nonatomic) CGPoint prevPoint; //自定义时间间隔的上一次监测位置
@end
