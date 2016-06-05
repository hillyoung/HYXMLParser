//
//  HYCoreXMLParser.h
//  XMLReader
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 luculent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface HYCoreXMLParser : NSObject

@property (strong, nonatomic) GDataXMLDocument *docutment;



/**
 *  解析xml格式的data，返回foundation对象
 *
 *  @param data xml格式的data
 *
 *  @return 返回foundation对象
 */
- (id)objectWithData:(NSData *)data ;


@end
