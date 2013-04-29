//
//  ImageView.h
//  iReporter
//
//  Created by 文杰 胡 on 12-12-2.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#define kThumbSide 180
#define kPadding 10

@protocol ImageViewDelegate <NSObject>
-(void)didSelectImage:(id)sender;
@end

@interface ImageView : UIButton<ImageViewDelegate>
{
}
@property (nonatomic, retain) UIImage* image;
@property (nonatomic, assign) NSString *imageName;
@property (assign, nonatomic) id<ImageViewDelegate> delegate;
-(id)initWithIndex:(int)i andData:(NSDictionary*)data;
@end
