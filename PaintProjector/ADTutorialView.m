//
//  TutorialView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialView.h"
#import "ADPaintUIKitStyle.h"

@implementation ADTutorialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
//    self.textLabelAutoLayout = true;
}

//仅支持一个［］的着色
- (NSAttributedString*)decorateString:(NSString *)string{
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableAttributedString * resultString = [[NSMutableAttributedString alloc] init];
    
    NSError *error = nil;
    NSString *pattern = @"\\[(.*?)\\]";
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                                options:0
                                                                                  error:&error];
    NSTextCheckingResult *result = [expression firstMatchInString:string
                                                          options:0
                                                            range:NSMakeRange(0, string.length)];
    if (result) {
        NSRange range1 = [result rangeAtIndex:1];
        NSString *rangeString = [NSString stringWithFormat:@"%u %u", 0, range1.location-1];
        NSRange range0 = NSRangeFromString(rangeString);
        NSUInteger start = range1.location + range1.length + 1;
        rangeString = [NSString stringWithFormat:@"%u %u", start, string.length - start];
        NSRange range2 = NSRangeFromString(rangeString);
        
        [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range0];
        [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor selectableColor] range:range1];
        [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range2];
        
        [resultString appendAttributedString:[attributeString attributedSubstringFromRange:range0]];
        [resultString appendAttributedString:[attributeString attributedSubstringFromRange:range1]];
        [resultString appendAttributedString:[attributeString attributedSubstringFromRange:range2]];
        
    }
    else{
        resultString = attributeString;
    }

    
    return resultString;
}

//决定tutorialView下的nextButton是内置的button，还是界面上的某个button,
//如果是界面上的某个button,加上事件后,在dealloc tutorialView后需要移除这个事件
- (void)initWithTutorial:(ADTutorial*)tutorial description:(NSString *)desc bgImage:(UIImage*)image{
    self.delegate = tutorial;
    
    if (desc) {
        ADSharedLabel *label = [[ADSharedLabel alloc]init];
        self.textLabel = label;
//        label.textColor = [UIColor darkGrayColor];
        
        //转换到nsAttributeString
        label.attributedText = [self decorateString:desc];
        
        [label setNumberOfLines:10];
        [label setLineBreakMode:NSLineBreakByTruncatingTail];

        [self addSubview:label];
        [self setNeedsLayout];
    }
    if (image) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        self.imageView = imageView;

        [self addSubview:imageView];
        [self sendSubviewToBack:imageView];
    }
}

- (void)layoutSubviews{
    CGRect frame = self.imageView.frame;
    frame.size = self.frame.size;
    self.imageView.frame = frame;
    
    if (self.layoutCompletionBlock) {
        self.layoutCompletionBlock();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
