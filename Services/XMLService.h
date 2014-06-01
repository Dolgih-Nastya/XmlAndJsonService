//
//  XMLService.h
//  XMLAndJSONParsing
//
//  Created by Vlad Korzun on 01.06.14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ActionWithObject)(id);

@interface XMLService : NSObject<NSXMLParserDelegate>

+ (void)parseWithData:(NSData *)data completion:(ActionWithObject)completion;

@end
