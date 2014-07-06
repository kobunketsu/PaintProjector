//
//  ImageView.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-2.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADImageView.h"

@implementation ADImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWithIndex:(int)i andData:(NSDictionary*)data {
    self = [super init];
    if (self !=nil) {
        //initialize
//        self.tag = [[data objectForKey:@"IdImage"] intValue];
        
        int row = i/3;
        int col = i % 3;
        
        self.frame = CGRectMake(1.5*kPadding+col*(kThumbSide+kPadding), 1.5*kPadding+row*(kThumbSide+kPadding), kThumbSide, kThumbSide);
        self.backgroundColor = [UIColor grayColor];
        
        //add the photo caption
        UILabel* caption = [[UILabel alloc] initWithFrame:
                            CGRectMake(0, kThumbSide-16, kThumbSide, 16)
                            ];
        caption.backgroundColor = [UIColor blackColor];
        caption.textColor = [UIColor whiteColor];
        caption.textAlignment = UITextAlignmentCenter;
        caption.font = [UIFont systemFontOfSize:12];
        caption.text = [NSString stringWithFormat:@"@%@",[data objectForKey:@"caption"]];
        [self addSubview: caption];
        
        NSString* bgType = [data objectForKey:@"bgType"];
        if([bgType  isEqual: @"scene"]){
            self.tag = 1;
        }
        else {
            self.tag = 0;
        }
        
		//step 2
        //add touch event
        [self addTarget:self.delegate action:@selector(didSelectImage:) forControlEvents:UIControlEventTouchUpInside];
        
        //load the image
        self.imageName = [data objectForKey:@"imageName"];
        self.image = [UIImage imageNamed:self.imageName];
        //create an image view, add it to the view
        UIImageView* thumbView = [[UIImageView alloc] initWithImage: self.image];
        thumbView.frame = CGRectMake(0,0,180,180);
        thumbView.contentMode = UIViewContentModeScaleAspectFit;
        [self insertSubview: thumbView belowSubview: caption];
        
    }
    return self;
}
@end
