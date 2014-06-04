//
//  PJSONParser.m
//  XMLAndJSONParsing
//
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "PJSONParser.h"
#import "PJSONObject.h"

@interface PJSONParser()
@end

@implementation PJSONParser
+ (void)parseWithData:(id)data completion:(ActionWithObject)completion
{
    if ([data isKindOfClass:[NSDictionary class]])
    {
        PJSONObject *obj = [PJSONObject new];
        NSArray* arrayOfKeys = [data allKeys];
        obj.field1 = [data valueForKey:[arrayOfKeys objectAtIndex:0]];
        obj.field2 = [data valueForKey:[arrayOfKeys objectAtIndex:1]];
        completion(obj);
    }
}
@end
