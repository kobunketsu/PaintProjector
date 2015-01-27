//
//  ADAutoAlertView.h
//  PaintProjector
//
//  Created by kobunketsu on 9/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AutoAlertViewClickHandler)(BOOL confirm);

@interface ADSimpleAlertView : UIAlertView
<UIAlertViewDelegate>
{
}

@property (copy, nonatomic) AutoAlertViewClickHandler clickHandler;

@end
