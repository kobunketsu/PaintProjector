//
//  ADTestShare.m
//  PaintProjector
//
//  Created by 胡 文杰 on 8/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ADTestShare : XCTestCase

@end

@implementation ADTestShare

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

- (void)testTrue {
    XCTAssert(1, @"Can not be zero");
}

@end
