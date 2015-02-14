//
//  JaJaControlConnection.h
//  JaJa-SDK
//
//  Copyright (c) 2012 Silicon Spark pt ltd. All rights reserved. International Patents Pending.
//

#import <Foundation/Foundation.h>
@protocol JaJaControlDelegate;
@interface JaJaControlConnection : NSObject {
    @public
    BOOL started;
    BOOL signalAvailable;

    float signalValue;
    BOOL firstButtonPressed;
    BOOL secondButtonPressed;

    id<JaJaControlDelegate> delegate;
}
/*!
 @property started
 @abstract A Boolean value that indicates whether the Sound Detector is running or not. (read-only)
 */
@property(nonatomic, readonly) BOOL started;
/*!
 @property signalAvailable
 @abstract A Boolean value that indicates whether signal is avaliable or not. (read-only)
 */
@property(nonatomic, readonly) BOOL signalAvailable;

/*!
 @property signalValue
 @abstract A float value that represents the pressure level. Can be in range [0, 1] (read-only)
 */
@property(nonatomic, readonly) float signalValue;
/*!
 @property firstButtonPressed
 @abstract A Boolean value that indicates whether the first button is pressed or not. (read-only)
 */
@property(nonatomic, readonly) BOOL firstButtonPressed;
/*!
 @property secondButtonPressed
 @abstract A Boolean value that indicates whether the second button is pressed or not. (read-only)
 */
@property(nonatomic, readonly) BOOL secondButtonPressed;
/*!
 @property delegate
 @abstract The receiver’s delegate or nil if it doesn’t have a delegate.
 */
@property(nonatomic, assign) id<JaJaControlDelegate> delegate;

- (NSError*)start;
- (void)stop;


@end
