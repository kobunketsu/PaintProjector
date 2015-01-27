//
//  ImageView.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-2.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#define kThumbSide 180
#define kPadding 10

@protocol ADImageViewDelegate <NSObject>
-(void)didSelectImage:(id)sender;
@end

@interface ADImageView : UIButton<ADImageViewDelegate>
{
}
@property (retain, nonatomic) UIImage* image;
@property (copy, nonatomic) NSString *imageName;
@property (assign, nonatomic) id<ADImageViewDelegate> delegate;
-(id)initWithIndex:(int)i andData:(NSDictionary*)data;
@end
