//
//  Pen.h
//  iReporter
//
//  Created by 文杰 胡 on 12-11-13.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Brush.h"

@interface Pen : Brush
{
    float _startRadius;
    float _endRadius;
    float _lastDist;
    
    float _lastDrawRadius;
    
}

@end
