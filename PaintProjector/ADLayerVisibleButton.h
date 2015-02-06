//
//  LayerVisibleButton.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADSharedSubButton.h"
@interface ADLayerVisibleButton : ADSharedSubButton
@property(nonatomic, setter = setIsVisible:,  assign)BOOL isVisible;
@end
