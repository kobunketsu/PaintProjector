//==============================================================================
//
//  InfColorBarPicker.h
//  InfColorPicker
//
//  Created by Troy Gaul on 8/9/10.
//
//  Copyright (c) 2011 InfinitApps LLC - http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import <UIKit/UIKit.h>
#import "InfColorPickerIndicatorMagnify.h"

@class InfColorIndicatorView;

//------------------------------------------------------------------------------

@interface InfColorBarView : UIView

@end

//------------------------------------------------------------------------------

@interface InfColorBarPicker : UIControl {
	InfColorIndicatorView* indicator;
}
@property( retain, nonatomic) UIView* rootView;
@property( nonatomic ) float value;
@property(retain, nonatomic)IBOutlet  InfColorPickerIndicatorMagnify * indicatorMagnify;
@end

//------------------------------------------------------------------------------
