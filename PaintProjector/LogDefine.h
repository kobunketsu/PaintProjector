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
    #else
    #define _DebugLog(s, ...)
    #endif

    #ifdef DEBUG
    //警告的log
    #define _DebugLogWarn(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg255,255,0;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogWarn(s, ...)
    #endif

    #ifdef DEBUG
    //严重错误的log
    #define _DebugLogError(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg255,0,0;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogError(s, ...)
    #endif

    #ifdef DEBUG
    //成功的log
    #define _DebugLogWriteSuccess(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg0,255,0;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogWriteSuccess(s, ...)
    #endif

    #ifdef DEBUG
    //系统函数调用的log
    #define _DebugLogSystem(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg127,127,127;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogSystem(s, ...) NSString *str = [NSString stringWithFormat:@"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__]];[RemoteLog log:str];
    #endif

    #ifdef DEBUG
    //用户交互的log
    #define _DebugLogIBAction(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg0,64,64;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogIBAction(s, ...)
    #endif

    #ifdef DEBUG
    //函数开始的log
    #define _DebugLogFuncStart(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg0,0,127;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogFuncStart(s, ...) NSString *str = [NSString stringWithFormat:@"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__]];[RemoteLog log:str];
    #endif

    #ifdef DEBUG
    //函数每帧都调用的log
    #define _DebugLogFuncUpdate(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg0,0,255;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogFuncUpdate(s, ...)
    #endif

    #ifdef DEBUG
    //函数每帧都调用的log
    #define _DebugLogGL(s, ...) NSLog(XCODE_COLORS_ESCAPE @"bg255,0,255;" @"<%p %@:(%d)> %@" XCODE_COLORS_RESET, self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogGL(s, ...)
    #endif

    #ifdef DEBUG
    //函数每帧都调用的log (去除self指针)
    #define _DebugLogProfile(s, ...) NSLog(XCODE_COLORS_ESCAPE @"fg255,125,0;" @"<%@:(%d)> %@" XCODE_COLORS_RESET, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
    #else
    #define _DebugLogProfile(s, ...)
    #endif

#endif

//global switcher
#define DebugLog(s,...)                 _DebugLog(s, ##__VA_ARGS__)
#define DebugLogWarn(s,...)             _DebugLogWarn(s, ##__VA_ARGS__)
#define DebugLogError(s,...)            _DebugLogError(s, ##__VA_ARGS__)
#define DebugLogWriteSuccess(s,...)     _DebugLogWriteSuccess(s, ##__VA_ARGS__)
#define DebugLogSystem(s,...)           _DebugLogSystem(s, ##__VA_ARGS__)
#define DebugLogIBAction(s,...)         _DebugLogIBAction(s, ##__VA_ARGS__)
#define DebugLogFuncStart(s,...)        _DebugLogFuncStart(s, ##__VA_ARGS__)
#define DebugLogFuncUpdate(s,...)       _DebugLogFuncUpdate(s, ##__VA_ARGS__)
#define DebugLogGL(s,...)               _DebugLogGL(s, ##__VA_ARGS__)
#define DebugLogProfile(s,...)          //_DebugLogProfile(s, ##__VA_ARGS__)