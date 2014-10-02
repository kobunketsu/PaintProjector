//
//  ADPageControl.m
//  PaintProjector
//
//  Created by kobunketsu on 9/27/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADPageControl.h"
#import "ADNextPageButton.h"
#import "ADPreviousPageButton.h"

#define PageButtonSize 32
@interface ADPageControl()
@property (weak, nonatomic) UIScrollView *scrollView;
@end

@implementation ADPageControl
- (id)initWithScrollView:(UIScrollView*)scrollView size:(CGSize)size{
    self = [super init];
    if (self) {
        _scrollView = scrollView;
        _scrollView.clipsToBounds = false;
        DebugLog(@"scrollView frame %@", NSStringFromCGRect(scrollView.frame));
        
        _previousButton = [[ADPreviousPageButton alloc]initWithFrame:CGRectMake(0, size.height * 0.5 - PageButtonSize*0.5, PageButtonSize, PageButtonSize)];
        _previousButton.hidden = true;

        
        _nextButton = [[ADNextPageButton alloc]initWithFrame:CGRectMake(size.width - PageButtonSize, size.height * 0.5 - PageButtonSize*0.5, PageButtonSize, PageButtonSize)];

        
        [_scrollView.superview addSubview:_previousButton];
        [_scrollView.superview addSubview:_nextButton];
    }
    return self;
}
- (void)initCustom{
    [_previousButton addTarget:self action:@selector(previousButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [_nextButton addTarget:self action:@selector(nextButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)nextButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"CMN_nextPageButtonTouchUp" identifier:sender];
    CGPoint contentOffset = self.scrollView.contentOffset;
    contentOffset.x += (self.scrollView.contentSize.width / 3.0);
    self.scrollView.contentOffset = contentOffset;
}

- (void)previousButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"CMN_previousPageButtonTouchUp" identifier:sender];
}
@end
