//
//  XMLService.h
//  XMLAndJSONParsing
//
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ActionWithObject)(id);

@interface XMLService : NSObject<NSXMLParserDelegate>

+ (void)parseWithData:(id)data completion:(ActionWithObject)completion;

@end
