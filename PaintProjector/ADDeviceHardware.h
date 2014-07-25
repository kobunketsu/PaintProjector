//
//  UIDeviceHardware.h
//
//  Used to determine EXACT version of device software is running on.

#import <Foundation/Foundation.h>

@interface ADDeviceHardware : NSObject 
+(ADDeviceHardware*)sharedInstance;
- (NSString *) platform;
- (NSString *) platformString;
@property (assign, nonatomic, readonly) BOOL isMini;
@end