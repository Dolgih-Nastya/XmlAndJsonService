//
//  PXMLFeed.h
//  XMLAndJSONParsing
//
//  Created by Vlad Korzun on 01.06.14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PXMLFeed : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *pdalink;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *pubDate;
@property (nonatomic, strong) NSString *fulltext;

@end
