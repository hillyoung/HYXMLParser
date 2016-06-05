//
//  HYCoreXMLParser.m
//  XMLReader
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 luculent. All rights reserved.
//

#import "HYCoreXMLParser.h"

@implementation HYCoreXMLParser

+ (HYCoreXMLParser *)defaultParser {
    HYCoreXMLParser *parser = [[HYCoreXMLParser alloc] init];
    return parser;
}


#pragma mark - Private

- (GDataXMLDocument *)docutment {
    if (!_docutment) {
        _docutment = [[GDataXMLDocument alloc] init];
    }
    
    return _docutment;
}


#pragma mark - Message



- (id)objectWithData:(NSData *)data {
    return nil;
}

@end
