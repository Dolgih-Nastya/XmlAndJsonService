//
//  PJSONParser.h
//  XMLAndJSONParsing
//
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ActionWithObject)(id);
@interface PJSONParser : NSObject
+ (void)parseWithData:(NSData *)data completion:(ActionWithObject)completion;
@end
