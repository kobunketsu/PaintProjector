//
//  Command.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
//@protocol CommandDelegate
//-(void)willEndCommand;
//@end

@interface Command : NSObject
//@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) BOOL isUndoBaseWrapped;//被打包到undobase的texture中的命令

-(void)execute;
-(void)endExecute;


@end
