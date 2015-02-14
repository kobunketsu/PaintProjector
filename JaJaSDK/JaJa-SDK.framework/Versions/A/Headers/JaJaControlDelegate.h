//
//  JaJaControlDelegate.h
//  JaJa-SDK
//
//  Copyright (c) 2012 Silicon Spark pt ltd. All rights reserved. International Patents Pending.
//
#import <Foundation/Foundation.h>

@class JaJaControlConnection;
/*!
 @protocol JajaControlDelegate
 @abstract Jaja control delegate protocol
 @discussion The JajaControlDelegate protocol defines the methods a delegate of a JajaControlConnection object should implement. 
The delegate implements the button actions and any other custom behavior.
 */
@protocol JaJaControlDelegate <NSObject>

/*!
 @method jajaControlError
 @abstract Sent to the delegate when something goes wrong.
 */
-(void)jajaControlError;
/*!
 @method jajaControlSignalLost
 @abstract Sent to the delegate when signal is lost.
 */
- (void)jajaControlSignalLost;

/*!
 @method jajaControlSignalRestored
 @abstract Sent to the delegate when signal is restored.
 */
- (void)jajaControlSignalRestored;

/*!
 @method jajaControlSignalValueChangeв:
 @abstract Sent to the delegate when pressure is changed.
 @param newValue The current pressure value. 0 - 1
 */
- (void)jajaControlSignalValueChanged:(float)newValue;

/*!
 @method firstButtonValueChanged:
 @abstract Sent to the delegate when pressure is changed.
 @param value The current state of button. 
 */
- (void)firstButtonValueChanged:(BOOL)value;

/*!
 @method secondButtonValueChanged:
 @abstract Sent to the delegate when pressure is changed.
 @param value The current state of button. 
 */
- (void)secondButtonValueChanged:(BOOL)value;

@end
