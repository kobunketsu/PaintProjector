//
//  TestUltility.h
//  iReporter
//
//  Created by 文杰 胡 on 13-3-2.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface TestUltility : NSObject{
    
}
- (NSString*)applicationDocumentDirectory;
- (GLubyte*)loadTextureDataFromFile:(NSString*)filePath;
- (GLubyte*)loadTextureDataFromFileInDocument:(NSString*)filePathInDoc;
@end
