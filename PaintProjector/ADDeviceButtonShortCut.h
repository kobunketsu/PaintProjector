//
//  ADDeviceButtonShortCut.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ADDeviceButtonShortcut : NSObject
@property (retain, nonatomic) JotShortcut *jotShortCut;
@property (copy) NSString *descriptiveText;

@property (copy) NSString *key;

@property (assign) id target;

@property SEL selector;

- (instancetype)initWithDescriptiveText:(NSString *)descriptiveText key:(NSString *)key target:(id)target selector:(SEL)selector;
@end
