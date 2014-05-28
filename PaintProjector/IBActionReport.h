//
//  IBActionReport.h
//  PaintProjector
//
//  Created by 胡 文杰 on 5/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBActionReport : NSObject
+ (void)logAction:(NSString *)name identifier:(id)sender;
@end
