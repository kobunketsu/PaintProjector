//
//  API.h
//  iReporter
//
//  Created by 文杰 胡 on 12-10-23.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFNetworking.h"
typedef void (^JSONResponseBlock)(NSDictionary* json);
@interface API : AFHTTPClient
@property (strong, nonatomic) NSDictionary* user;
+(API*)sharedInstance;
-(BOOL)isAuthorized;
-(void)commandWithParams:(NSMutableDictionary*)params onCompletion:(JSONResponseBlock)completionBlock;
-(NSURL*)urlForImageWithId:(NSNumber*)IdPhoto isThumb:(BOOL)isThumb;
@end
