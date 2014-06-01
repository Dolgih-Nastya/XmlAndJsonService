//
//  XMLService.m
//  XMLAndJSONParsing
//
//  Created by Vlad Korzun on 01.06.14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import "XMLService.h"
#import "PXMLFeed.h"

@interface XMLService()

@property(nonatomic, strong) NSXMLParser *xmlParser;
@property(nonatomic, copy) ActionWithObject completionBlock;
@property(nonatomic, strong) NSString *currentElement;

@property (nonatomic, strong) PXMLFeed *currentFeed;
@property (nonatomic, strong) NSMutableArray *allFeed;

@end

@implementation XMLService

+ (void)parseWithData:(NSData *)data completion:(ActionWithObject)completion
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    XMLService *xmlService = [XMLService new];
    xmlService.xmlParser = parser;
    xmlService.completionBlock = completion;
    parser.delegate = xmlService;
    xmlService.allFeed = [NSMutableArray new];
    [parser parse];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    self.completionBlock(self.allFeed);
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    self.currentElement = elementName;
    if([elementName isEqualToString:@"item"])
    {
        self.currentFeed = [PXMLFeed new];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if(![string isEqualToString:@""] && ![string isEqual:@"\n"])
    {
        if([self.currentElement isEqualToString:@"title"])
        {
            self.currentFeed.title = string;
        }
        if([self.currentElement isEqualToString:@"pdalink"])
        {
            self.currentFeed.pdalink = string;
        }
        if([self.currentElement isEqualToString:@"category"])
        {
            self.currentFeed.category = string;
        }
        if([self.currentElement isEqualToString:@"author"])
        {
            if(!self.currentFeed.author){
                self.currentFeed.author = string;
            } else {
                self.currentFeed.author = [self.currentFeed.author stringByAppendingString:string];
                self.currentFeed.author = [self.currentFeed.author stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            }
        }
        if([self.currentElement isEqualToString:@"pubDate"])
        {
            self.currentFeed.pubDate = string;
        }
        if([self.currentElement isEqualToString:@"fulltext"])
        {
            if(!self.currentFeed.fulltext){
                self.currentFeed.fulltext = string;
            } else {
                self.currentFeed.fulltext = [self.currentFeed.fulltext stringByAppendingString:string];
                self.currentFeed.fulltext = [self.currentFeed.fulltext stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            }
        }

    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if([elementName isEqualToString:@"item"])
    {
        [self.allFeed addObject:self.currentFeed];
    }
}


@end
