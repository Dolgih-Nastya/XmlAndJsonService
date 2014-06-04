//
//  PJSONMainService.h
//  XMLAndJSONParsing
//
//  Created by Анастасия Долгих on 6/4/14.
//  Copyright (c) 2014 Dolgih Nastya. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ActionWithObject)(id);
@interface PJSONMainService : NSObject
- (void)parseWithComletion:(ActionWithObject)completion;
@end
