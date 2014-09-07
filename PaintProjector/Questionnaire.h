//
//  Questionnaire.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/6/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Questionnaire : NSObject<UIAlertViewDelegate>
+ (Questionnaire *)sharedInstance;

@property (retain, nonatomic) NSMutableArray *questions;
@property (retain, nonatomic) NSMutableArray *answers;
//@property (assign, nonatomic) id delegate;
- (void)addYesNoQuestion:(NSString*)question;
- (void)addFeedbackBox;
- (void)show;
@end

//@protocol QuestionnaireDelegate
//- (void)willSubmitFeedback;
//@end
