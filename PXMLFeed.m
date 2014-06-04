//
//  PXMLFeed.m
//  XMLAndJSONParsing
//
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "PXMLFeed.h"

@implementation PXMLFeed

- (NSString *)description
{
    return [NSString stringWithFormat:@"title: %@\npdalink: %@\ncategory: %@\nauthor: %@\npubDate: %@\nfullText: %@\n", self.title,self.pdalink,self.category,self.author,self.pubDate,self.fulltext];
}


@end
