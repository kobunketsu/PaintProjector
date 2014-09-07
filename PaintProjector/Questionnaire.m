//
//  Questionnaire.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/6/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Questionnaire.h"
@interface Questionnaire()
@property (assign, nonatomic) NSInteger curIndex;
@property (retain, nonatomic) UITextField *feedbackBox;
@end

@implementation Questionnaire
+ (Questionnaire *)sharedInstance
{
    static Questionnaire *sharedInstance = nil;
    if (sharedInstance == nil)
    {
        sharedInstance = [[Questionnaire alloc] init];
    }
    return sharedInstance;
}

- (id)init{
    self = [super init];
    if (self) {
        _questions = [[NSMutableArray alloc]init];
        _answers = [[NSMutableArray alloc]init];
        _curIndex = 0;
    }
    return self;
}

- (void)addYesNoQuestion:(NSString*)question{
    if ([self.questions containsObject:question]) {
        return;
    }
    
    [self.questions addObject:question];
    [self.answers addObject:@"NO"];
}

- (void)addFeedbackBox{
}

//list question one by one;
- (void)show{
    self.curIndex = 0;
    NSString *firstQuestion = self.questions[self.curIndex];

    if (!firstQuestion) {
        return;
    }
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(firstQuestion, nil) delegate:self cancelButtonTitle:NSLocalizedString(@"NO", nil) otherButtonTitles:NSLocalizedString(@"YES", nil), nil];
    [alertView show];
    return;
}

//next question
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        [self submitFeedback];
        return;
    }
    self.answers[self.curIndex] = buttonIndex == 0 ? @"NO" : @"YES";
    self.curIndex ++;
    
    if (self.curIndex >= self.questions.count) {
        //Questionnaire over
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"ThankYouForFeedback", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Submit", nil) otherButtonTitles:nil, nil];
        alertView.tag = 1;
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        //add additional feedback box
        self.feedbackBox = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 500, 200)];
        [alertView addSubview:self.feedbackBox];
        
        [alertView show];
    }
    else{
        //record answer
        NSString *nextQuestion = self.questions[self.curIndex];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(nextQuestion, nil) delegate:self cancelButtonTitle:NSLocalizedString(@"NO", nil) otherButtonTitles:NSLocalizedString(@"YES", nil), nil];
        [alertView show];
    }
}

- (void)submitFeedback{
    for (int i = 0; i < self.questions.count; ++i) {
        NSString *question = self.questions[i];
        BOOL answer = ((NSNumber*)self.answers[i]).boolValue;
        NSString *feedback = [NSString stringWithFormat:@"Q: %@ A: %i", question, answer];
        [TestFlight submitFeedback:feedback];
    }
    
    if (self.feedbackBox.text) {
        NSString *additionalFeedback = [NSString stringWithFormat:@"Feedback: %@", self.feedbackBox.text];
        [TestFlight submitFeedback:additionalFeedback];
    }
    
}
@end
