//
//  TestGLKViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-7.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "TestGLKViewController.h"

@interface TestGLKViewController ()

@end

@implementation TestGLKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    if (!self.context) {
        DebugLog(@"Failed to create ES context");
    }
    [EAGLContext setCurrentContext:self.context];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [view bindDrawable];
    glViewport(0, 0, view.bounds.size.height, view.bounds.size.height);
    
    glClearColor(1.0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
}


@end
