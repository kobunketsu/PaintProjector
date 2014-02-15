//
//  PhotoView.h
//  iReporter
//
//  Created by 文杰 胡 on 12-10-27.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

//1 layout config
#define kThumbSide 90
#define kPadding 10

//2 define the thumb delegate protocol
@protocol PhotoViewDelegate <NSObject>
-(void)didSelectPhoto:(id)sender;
@end

//3 define the thumb view interface
@interface PhotoView : UIButton <PhotoViewDelegate>
@property (assign, nonatomic) id<PhotoViewDelegate> delegate;
-(id)initWithIndex:(int)i andData:(NSDictionary*)data;
@end