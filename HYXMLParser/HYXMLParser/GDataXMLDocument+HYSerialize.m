//
//  GDataXMLDocument+HYSerialize.m
//  HYXMLParser
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 SimonYoung. All rights reserved.
//

#import "GDataXMLDocument+HYSerialize.h"

@implementation GDataXMLDocument (HYSerialize)

- (id)contentObject {
    if (![self XMLData].length) {
        return nil;
    }
    
    return nil;
}

@end
