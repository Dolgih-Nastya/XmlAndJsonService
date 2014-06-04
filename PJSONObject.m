//
//  PJSONObject.m
//  XMLAndJSONParsing
//
//  Created by Анастасия Долгих on 6/4/14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "PJSONObject.h"

@implementation PJSONObject
- (NSString *)description
{
    return [NSString stringWithFormat:@"feild1: %@\nfield2: %@ ", self.field1,self.field2];
}@end
