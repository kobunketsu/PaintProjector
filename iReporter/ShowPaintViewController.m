//
//  ShowPaintViewController.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-24.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "ShowPaintViewController.h"

static CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};

@interface ShowPaintViewController ()

@end

@implementation ShowPaintViewController
@synthesize videoDataOutput = _videoDataOutput;
@synthesize videoDataOutputQueue = _videoDataOutputQueue;
@synthesize previewView = _previewView;
@synthesize previewLayer = _previewLayer;
@synthesize faceDetector = _faceDetector;
@synthesize isUsingFrontFacingCamera = _isUsingFrontFacingCamera;
@synthesize isCameraScreenHidden;
@synthesize borderImage;
@synthesize eyeImage;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)awakeFromNib{
    isCameraScreenHidden = true;        

}
// find where the video box is positioned within the preview layer based on the video size and gravity
- (CGRect)videoPreviewBoxForGravity:(NSString *)gravity 
                          frameSize:(CGSize)frameSize 
                       apertureSize:(CGSize)apertureSize
{
    CGFloat apertureRatio = apertureSize.height / apertureSize.width;
    CGFloat viewRatio = frameSize.width / frameSize.height;
    
    CGSize size = CGSizeZero;
    if ([gravity isEqualToString:AVLayerVideoGravityResizeAspectFill]) {
        if (viewRatio > apertureRatio) {
            size.width = frameSize.width;
            size.height = apertureSize.width * (frameSize.width / apertureSize.height);
        } else {
            size.width = apertureSize.height * (frameSize.height / apertureSize.width);
            size.height = frameSize.height;
        }
    } else if ([gravity isEqualToString:AVLayerVideoGravityResizeAspect]) {
        if (viewRatio > apertureRatio) {
            size.width = apertureSize.height * (frameSize.height / apertureSize.width);
            size.height = frameSize.height;
        } else {
            size.width = frameSize.width;
            size.height = apertureSize.width * (frameSize.width / apertureSize.height);
        }
    } else if ([gravity isEqualToString:AVLayerVideoGravityResize]) {
        size.width = frameSize.width;
        size.height = frameSize.height;
    }
	
	CGRect videoBox;
	videoBox.size = size;
	if (size.width < frameSize.width)
		videoBox.origin.x = (frameSize.width - size.width) / 2;
	else
		videoBox.origin.x = (size.width - frameSize.width) / 2;
	
	if ( size.height < frameSize.height )
		videoBox.origin.y = (frameSize.height - size.height) / 2;
	else
		videoBox.origin.y = (size.height - frameSize.height) / 2;
    
	return videoBox;
}

- (CGRect)adjustRect:(CGRect)rect WithPreviewBox:(CGRect)previewBox ClearAperture:(CGRect)clearAperture isMirrored:(BOOL)isMirrored {
    // flip preview width and height 翻转宽高
    CGFloat temp = rect.size.width;
    rect.size.width = rect.size.height;
    rect.size.height = temp;
    //翻转原点的x,y位置
    temp = rect.origin.x;
    rect.origin.x = rect.origin.y;
    rect.origin.y = temp;
    
    // scale coordinates so they fit in the preview box, which may be scaled
    CGFloat widthScaleBy = previewBox.size.width / clearAperture.size.height;
    CGFloat heightScaleBy = previewBox.size.height / clearAperture.size.width;
    
    rect.size.width *= widthScaleBy;
    rect.size.height *= heightScaleBy;
    rect.origin.x *= widthScaleBy;
    rect.origin.y *= heightScaleBy;
    
    if ( isMirrored )
        rect = CGRectOffset(rect, previewBox.origin.x + previewBox.size.width - rect.size.width - (rect.origin.x * 2), previewBox.origin.y);
    else
        rect = CGRectOffset(rect, previewBox.origin.x, previewBox.origin.y);    
    
    return rect;
}
// called asynchronously as the capture output is capturing sample buffers, this method asks the face detector
// to detect features and for each draw the green border in a layer and set appropriate orientation
- (void)drawFaces:(NSArray *)features 
      forVideoBox:(CGRect)clearAperture 
      orientation:(UIDeviceOrientation)orientation
{
	NSArray *sublayers = [NSArray arrayWithArray:[self.previewLayer sublayers]];
	NSInteger sublayersCount = [sublayers count], currentSublayer = 0;
	NSInteger featuresCount = [features count], currentFeature = 0;
	
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	
	// hide all the face layers
	for ( CALayer *layer in sublayers ) {
		if ( [[layer name] isEqualToString:@"FaceLayer"] )
			[layer setHidden:YES];
	}	
	
	if ( featuresCount == 0 ) {
		[CATransaction commit];
		return; // early bail.
	}
    
	CGSize parentFrameSize = [self.previewView frame].size;
	NSString *gravity = [self.previewLayer videoGravity];
	BOOL isMirrored = [self.previewLayer isMirrored];
	CGRect previewBox = [self videoPreviewBoxForGravity:gravity 
                                                        frameSize:parentFrameSize 
                                                     apertureSize:clearAperture.size];
	for ( CIFaceFeature *ff in features ) {
		// find the correct position for the square layer within the previewLayer
		// the feature box originates in the bottom left of the video frame.
		// (Bottom right if mirroring is turned on)

		CGRect faceRect = [ff bounds];
        faceRect = [self adjustRect:faceRect WithPreviewBox:previewBox ClearAperture:clearAperture isMirrored:isMirrored];
        
        //调整left eye
		CGRect leftEye = CGRectMake(ff.leftEyePosition.x, ff.leftEyePosition.y, faceRect.size.width * 0.3, faceRect.size.height * 0.3);
        leftEye = [self adjustRect:leftEye WithPreviewBox:previewBox ClearAperture:clearAperture isMirrored:isMirrored];
        
        //调整right eye		
 		CGRect rightEye = CGRectMake(ff.rightEyePosition.x, ff.rightEyePosition.y, faceRect.size.width * 0.3, faceRect.size.height * 0.3);
        rightEye = [self adjustRect:rightEye WithPreviewBox:previewBox ClearAperture:clearAperture isMirrored:isMirrored];
        
        CGPoint vec = CGPointMake(rightEye.origin.x - leftEye.origin.x, rightEye.origin.y - leftEye.origin.y);
        float distSqr = vec.x*vec.x + vec.y*vec.y;
        NSLog(@"distance %.2f", distSqr);
        

        
        //计算眼睛的世界坐标系
//        float h;//eye to device height
//        float dN;//eye to device distance        
//        GLKVector3 eye = GLKVector3Make(0, h, 0); 
//        float dL = 0.2412;//device length (ipad2)
//        float dW = 0.1857;
        float dTwoEye = 0.065;
        
        float angle = -self.previewView.lastPitch;//device angle 由于问题，取负
        
        GLKVector3 deviceUp = GLKVector3Make(cosf(angle), sinf(angle), 0);
        GLKVector3 deviceNormal = GLKVector3Make(-sinf(angle), cosf(angle), 0);
        GLKVector3 deviceRight = GLKVector3CrossProduct(deviceNormal, deviceUp);
        
        //计算眼睛在project matrix中的位置 假设摄像头为原点(Home键为原点公式不同) 双眼平行平面
        float viewWidth = previewBox.size.width;
//        float viewHeight = previewBox.size.height;
//        float zNear = 0.05; 
//        float zFar = 5.0;
//        float fovy = DegreesToRadians(34.1);
        float fovx = DegreesToRadians(44.5);
//        float aspect = 4.0 / 3.0;
        float headRollAngle = atanf(vec.y / vec.x);
        
        float widthAtEyeDepth = cosf(headRollAngle) * dTwoEye * viewWidth / fabs(vec.x);
        float dEyeToDevice = widthAtEyeDepth * 0.5 / tanf(fovx * 0.5);

        CGPoint midEye = CGPointMake((leftEye.origin.x + rightEye.origin.x)*0.5, (leftEye.origin.y + rightEye.origin.y)*0.5);
        float dCenterToMidEye = (midEye.x - viewWidth * 0.5) / (viewWidth * 0.5) * (widthAtEyeDepth * 0.5);
        
        //以前置摄像头为坐标系中点
        self.previewView.deviceToEye = GLKVector3Add(GLKVector3MultiplyScalar(deviceNormal, dEyeToDevice) , GLKVector3MultiplyScalar(deviceRight, dCenterToMidEye));
        
        
        
//        GLKVector4 eyeRScreen = GLKVector4Make((rightEye.origin.x - viewWidth * 0.5) / (viewWidth * 0.5), (rightEye.origin.y - viewHeight * 0.5) / (viewHeight * 0.5), 1, 1);
//        GLKVector4 eyeProj = GLKVector4MultiplyScalar(eyeRScreen, zFar);
//        //http://stackoverflow.com/questions/9261237/ipad-2-back-facing-camera-field-of-view
//        //iPad 2 back camera have an approximate 34.1 degree vertical field of view and an approximate 44.5 degree horizontal field of view.
//        GLKMatrix4 projMatrix = GLKMatrix4MakePerspective(fovy, aspect, zNear, zFar);
////        GLKMatrix4 invProjMatrix = GLKMatrix4Invert(projMatrix, true);
////        GLKVector4 eyeView = GLKMatrix4MultiplyVector4(invProjMatrix, eyeProj);

        
        //描画眼睛
        if(ff.hasLeftEyePosition)
        {
           NSLog(@"Left Eye: X:%.2f Y:%.2f", leftEye.origin.x, leftEye.origin.y);
            
            leftEyeLayer = nil;
            
            // re-use an existing layer if possible
            while ( !leftEyeLayer && (currentSublayer < sublayersCount) ) {
                CALayer *currentLayer = [sublayers objectAtIndex:currentSublayer++];
                if ( [[currentLayer name] isEqualToString:@"LeftEye"] ) {
                    leftEyeLayer = currentLayer;
                    [currentLayer setHidden:NO];
                }
            }
            
            // create a new one if necessary
            if ( !leftEyeLayer ) {
                leftEyeLayer = [[CALayer alloc]init];
                leftEyeLayer.contents = (id)self.eyeImage.CGImage;
                [leftEyeLayer setName:@"LeftEye"];
                [self.previewLayer addSublayer:leftEyeLayer];
                leftEyeLayer = nil;
            } 
            [leftEyeLayer setFrame:leftEye];            
        }

        if(ff.hasRightEyePosition)
        {
            NSLog(@"Right Eye: X:%.2f Y:%.2f", rightEye.origin.x, rightEye.origin.y);

            rightEyeLayer = nil;
            
            // re-use an existing layer if possible
            while ( !rightEyeLayer && (currentSublayer < sublayersCount) ) {
                CALayer *currentLayer = [sublayers objectAtIndex:currentSublayer++];
                if ( [[currentLayer name] isEqualToString:@"RightEye"] ) {
                    rightEyeLayer = currentLayer;
                    [currentLayer setHidden:NO];
                }
            }
            
            // create a new one if necessary
            if ( !rightEyeLayer ) {
                rightEyeLayer = [[CALayer alloc]init];
                rightEyeLayer.contents = (id)self.eyeImage.CGImage;
                [rightEyeLayer setName:@"RightEye"];
                [self.previewLayer addSublayer:rightEyeLayer];
                rightEyeLayer = nil;
            }
            [rightEyeLayer setFrame:rightEye];            
        }        
        
		//添加feature图层
//        CALayer *featureLayer = nil;
//		
//		// re-use an existing layer if possible
//		while ( !featureLayer && (currentSublayer < sublayersCount) ) {
//			CALayer *currentLayer = [sublayers objectAtIndex:currentSublayer++];
//			if ( [[currentLayer name] isEqualToString:@"FaceLayer"] ) {
//				featureLayer = currentLayer;
//				[currentLayer setHidden:NO];
//			}
//		}
//		
//		// create a new one if necessary
//		if ( !featureLayer ) {
//			featureLayer = [[CALayer alloc]init];
//			featureLayer.contents = (id)self.borderImage.CGImage;
//			[featureLayer setName:@"FaceLayer"];
//			[self.previewLayer addSublayer:featureLayer];
//			featureLayer = nil;
//		}
//		[featureLayer setFrame:faceRect];
//		
//		switch (orientation) {
//			case UIDeviceOrientationPortrait:
//				[featureLayer setAffineTransform:CGAffineTransformMakeRotation(DegreesToRadians(0.))];
//				break;
//			case UIDeviceOrientationPortraitUpsideDown:
//				[featureLayer setAffineTransform:CGAffineTransformMakeRotation(DegreesToRadians(180.))];
//				break;
//			case UIDeviceOrientationLandscapeLeft:
//				[featureLayer setAffineTransform:CGAffineTransformMakeRotation(DegreesToRadians(90.))];
//				break;
//			case UIDeviceOrientationLandscapeRight:
//				[featureLayer setAffineTransform:CGAffineTransformMakeRotation(DegreesToRadians(-90.))];
//				break;
//			case UIDeviceOrientationFaceUp:
//			case UIDeviceOrientationFaceDown:
//			default:
//				break; // leave the layer in its last known orientation
//		}
//		currentFeature++;
	}
	
	[CATransaction commit];
}

- (NSNumber *) exifOrientation: (UIDeviceOrientation) orientation
{
	int exifOrientation;
    /* kCGImagePropertyOrientation values
     The intended display orientation of the image. If present, this key is a CFNumber value with the same value as defined
     by the TIFF and EXIF specifications -- see enumeration of integer constants. 
     The value specified where the origin (0,0) of the image is located. If not present, a value of 1 is assumed.
     
     used when calling featuresInImage: options: The value for this key is an integer NSNumber from 1..8 as found in kCGImagePropertyOrientation.
     If present, the detection will be done based on that orientation but the coordinates in the returned features will still be based on those of the image. */
    
	enum {
		PHOTOS_EXIF_0ROW_TOP_0COL_LEFT			= 1, //   1  =  0th row is at the top, and 0th column is on the left (THE DEFAULT).
		PHOTOS_EXIF_0ROW_TOP_0COL_RIGHT			= 2, //   2  =  0th row is at the top, and 0th column is on the right.  
		PHOTOS_EXIF_0ROW_BOTTOM_0COL_RIGHT      = 3, //   3  =  0th row is at the bottom, and 0th column is on the right.  
		PHOTOS_EXIF_0ROW_BOTTOM_0COL_LEFT       = 4, //   4  =  0th row is at the bottom, and 0th column is on the left.  
		PHOTOS_EXIF_0ROW_LEFT_0COL_TOP          = 5, //   5  =  0th row is on the left, and 0th column is the top.  
		PHOTOS_EXIF_0ROW_RIGHT_0COL_TOP         = 6, //   6  =  0th row is on the right, and 0th column is the top.  
		PHOTOS_EXIF_0ROW_RIGHT_0COL_BOTTOM      = 7, //   7  =  0th row is on the right, and 0th column is the bottom.  
		PHOTOS_EXIF_0ROW_LEFT_0COL_BOTTOM       = 8  //   8  =  0th row is on the left, and 0th column is the bottom.  
	};
	
	switch (orientation) {
		case UIDeviceOrientationPortraitUpsideDown:  // Device oriented vertically, home button on the top
			exifOrientation = PHOTOS_EXIF_0ROW_LEFT_0COL_BOTTOM;
			break;
		case UIDeviceOrientationLandscapeLeft:       // Device oriented horizontally, home button on the right
			if (self.isUsingFrontFacingCamera)
				exifOrientation = PHOTOS_EXIF_0ROW_BOTTOM_0COL_RIGHT;
			else
				exifOrientation = PHOTOS_EXIF_0ROW_TOP_0COL_LEFT;
			break;
		case UIDeviceOrientationLandscapeRight:      // Device oriented horizontally, home button on the left
			if (self.isUsingFrontFacingCamera)
				exifOrientation = PHOTOS_EXIF_0ROW_TOP_0COL_LEFT;
			else
				exifOrientation = PHOTOS_EXIF_0ROW_BOTTOM_0COL_RIGHT;
			break;
		case UIDeviceOrientationPortrait:            // Device oriented vertically, home button on the bottom
		default:
			exifOrientation = PHOTOS_EXIF_0ROW_RIGHT_0COL_TOP;
			break;
	}
    return [NSNumber numberWithInt:exifOrientation];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput 
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer 
       fromConnection:(AVCaptureConnection *)connection
{	
	// get the image
	CVPixelBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
	CFDictionaryRef attachments = CMCopyDictionaryOfAttachments(kCFAllocatorDefault, sampleBuffer, kCMAttachmentMode_ShouldPropagate);
	CIImage *ciImage = [[CIImage alloc] initWithCVPixelBuffer:pixelBuffer 
                                                      options:(__bridge NSDictionary *)attachments];
	if (attachments) {
		CFRelease(attachments);
    }
    
    // make sure your device orientation is not locked.
	UIDeviceOrientation curDeviceOrientation = [[UIDevice currentDevice] orientation];
    
	NSDictionary *imageOptions = nil;
    
	imageOptions = [NSDictionary dictionaryWithObject:[self exifOrientation:curDeviceOrientation] 
                                               forKey:CIDetectorImageOrientation];
    
	NSArray *features = [self.faceDetector featuresInImage:ciImage 
                                                   options:imageOptions];
    
    // get the clean aperture
    // the clean aperture is a rectangle that defines the portion of the encoded pixel dimensions
    // that represents image data valid for display.
	CMFormatDescriptionRef fdesc = CMSampleBufferGetFormatDescription(sampleBuffer);
	CGRect cleanAperture = CMVideoFormatDescriptionGetCleanAperture(fdesc, false /*originIsTopLeft == false*/);
	
	dispatch_async(dispatch_get_main_queue(), ^(void) {
		[self drawFaces:features 
            forVideoBox:cleanAperture 
            orientation:curDeviceOrientation];
	});
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (_useFaceDetection) {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        
        [self setupAVCapture];
        self.borderImage = [UIImage imageNamed:@"border"];    
        self.eyeImage = [UIImage imageNamed:@"airBrushRadius16.png"];        
        NSDictionary *detectorOptions = [[NSDictionary alloc] initWithObjectsAndKeys:CIDetectorAccuracyLow, CIDetectorAccuracy, nil];
        self.faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:detectorOptions];
    }

}

- (void)setupAVCapture
{
    NSError *error = nil;
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [session setSessionPreset:AVCaptureSessionPreset640x480];
    } else {
        [session setSessionPreset:AVCaptureSessionPresetPhoto];
    }
    // Select a video device, make an input
    AVCaptureDevice *device;
    AVCaptureDevicePosition desiredPosition = AVCaptureDevicePositionFront;
    // find the front facing camera
    for (AVCaptureDevice *d in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo]) {
        if ([d position] == desiredPosition) {
            device = d;
            self.isUsingFrontFacingCamera = YES;
            break;
        }
    }
    // fall back to the default camera.
    if( nil == device )
    {
        self.isUsingFrontFacingCamera = NO;
        device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    // get the input device
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if( !error ) {
        
        // add the input to the session
        if ( [session canAddInput:deviceInput] ){
            [session addInput:deviceInput];
        }
        
        // Make a video data output
        self.videoDataOutput = [[AVCaptureVideoDataOutput alloc] init];
        
        // we want BGRA, both CoreGraphics and OpenGL work well with 'BGRA'
        NSDictionary *rgbOutputSettings = [NSDictionary dictionaryWithObject:
                                           [NSNumber numberWithInt:kCMPixelFormat_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
        [self.videoDataOutput setVideoSettings:rgbOutputSettings];
        [self.videoDataOutput setAlwaysDiscardsLateVideoFrames:YES]; // discard if the data output queue is blocked
        
        // create a serial dispatch queue used for the sample buffer delegate
        // a serial dispatch queue must be used to guarantee that video frames will be delivered in order
        // see the header doc for setSampleBufferDelegate:queue: for more information
        self.videoDataOutputQueue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL);
        [self.videoDataOutput setSampleBufferDelegate:self queue:self.videoDataOutputQueue];
        
        
        if ( [session canAddOutput:self.videoDataOutput] ){
            [session addOutput:self.videoDataOutput];
        }
        
        // get the output for doing face detection.
        [[self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:YES]; 
        
        self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
        self.previewLayer.backgroundColor = [[UIColor blackColor] CGColor];
        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        
//        CALayer *rootLayer = [self.previewView layer];
//        [rootLayer setMasksToBounds:YES];
//        [self.previewLayer setFrame:[rootLayer bounds]];
//        if (!isCameraScreenHidden) {
//            [rootLayer addSublayer:self.previewLayer];
//        }
        CALayer *layer3D = self.previewView.layer3D;
        [layer3D setMasksToBounds:YES];
        [self.previewLayer setFrame:[layer3D bounds]];
        if (!isCameraScreenHidden) {
            [layer3D addSublayer:self.previewLayer];
        }
        [session startRunning];
        
    }
    session = nil;
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:
                                  [NSString stringWithFormat:@"Failed with error %d", (int)[error code]]
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Dismiss"
                                                  otherButtonTitles:nil];
        [alertView show];
        [self teardownAVCapture];
    }     
}
// clean up capture setup
- (void)teardownAVCapture
{
	self.videoDataOutput = nil;
	if (self.videoDataOutputQueue) {
		dispatch_release(self.videoDataOutputQueue);
    }
	[self.previewLayer removeFromSuperlayer];
	self.previewLayer = nil;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    if (_useFaceDetection) {
        [self teardownAVCapture];
        self.faceDetector = nil;   
    }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
