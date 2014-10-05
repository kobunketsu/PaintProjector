//
//  DebugLog.h
//  PaintProjector
//
//  Created by 胡 文杰 on 8/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#ifndef PaintProjector_LogColor_h
#define PaintProjector_LogColor_h
//debug color
#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

#ifdef DEBUG
//普通的log
    #define _DebugLog(s, ...) NSLog(@"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//警告的log
    #define _DebugLogWarn(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg255,255,0;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//严重错误的log
    #define _DebugLogError(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg255,0,0;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//成功的log
    #define _DebugLogWriteSuccess(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg0,255,0;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//系统函数调用的log
    #define _DebugLogSystem(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg127,127,127;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//用户交互的log
    #define _DebugLogIBAction(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg0,64,64;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//函数开始的log
    #define _DebugLogFuncStart(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg0,0,127;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//函数每帧都调用的log
    #define _DebugLogFuncUpdate(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg0,0,255;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
//OpenGLES调用的log
    #define _DebugLogGL(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg255,0,255;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #define _DebugLogGLGroupStart(s, ...) glPushGroupMarkerEXT(0, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String]); _DebugLogGL(s, ##__VA_ARGS__);
    #define _DebugLogGLGroupEnd() glPopGroupMarkerEXT();
    #define DebugLogGLSnapshotStart [[REGLWrapper current].context presentRenderbuffer:GL_RENDERBUFFER];
    #define DebugLogGLSnapshotEnd DebugLogGLSnapshotStart
    #define DebugLogGLLabel(type,object,length,label) glLabelObjectEXT(type,object,length,label)
//函数每帧都调用的log (去除self指针)
    #define _DebugLogProfile(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg255,125,0;" @"<%@:(%d)> %@" XCODE_COLORS_RESET, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
//release版需要输出的LOG类型分：1.testflight log. 2.distribution log
//所有release版本的log都会testflight阶段显示在testflight和flurry中
    #define _DebugLog(s, ...)
    #define _DebugLogWarn(s, ...)
    #define _DebugLogError(s, ...)
    #define _DebugLogWriteSuccess(s, ...)
    #define _DebugLogSystem(s, ...) NSString *str = [NSString stringWithFormat:@"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__]];[RemoteLog log:str];
    #define _DebugLogIBAction(s, ...)
    #define _DebugLogFuncStart(s, ...) NSString *str = [NSString stringWithFormat:@"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__]];[RemoteLog log:str];
    #define _DebugLogFuncUpdate(s, ...)
    #define _DebugLogGL(s, ...)
    #define _DebugLogGLGroupStart(s, ...)
    #define _DebugLogGLGroupEnd()
    #define DebugLogGLSnapshotStart
    #define DebugLogGLSnapshotEnd
    #define DebugLogGLLabel(type,object,length,label)
    #define _DebugLogProfile(s, ...)
#endif

//global switcher
#define DebugLog(s,...)                 _DebugLog(s, ##__VA_ARGS__)
#define DebugLogWarn(s,...)             _DebugLogWarn(s, ##__VA_ARGS__)
#define DebugLogError(s,...)            _DebugLogError(s, ##__VA_ARGS__)
#define DebugLogWriteSuccess(s,...)     _DebugLogWriteSuccess(s, ##__VA_ARGS__)
#define DebugLogSystem(s,...)           _DebugLogSystem(s, ##__VA_ARGS__)
#define DebugLogIBAction(s,...)         _DebugLogIBAction(s, ##__VA_ARGS__)
#define DebugLogFuncStart(s,...)        _DebugLogFuncStart(s, ##__VA_ARGS__)
#define DebugLogFuncUpdate(s,...)       //_DebugLogFuncUpdate(s, ##__VA_ARGS__)
#define DebugLogGL(s,...)               //_DebugLogGL(s, ##__VA_ARGS__)
#define DebugLogGLGroupStart(s,...)     //_DebugLogGLGroupStart(s, ##__VA_ARGS__)
#define DebugLogGLGroupEnd()            //_DebugLogGLGroupEnd()
#define DebugLogProfile(s,...)          _DebugLogProfile(s, ##__VA_ARGS__)

#endif