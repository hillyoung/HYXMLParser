//
//  GDataXMLDocument+HYSerialize.h
//  HYXMLParser
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 SimonYoung. All rights reserved.
//

#import "GDataXMLNode.h"

@interface GDataXMLDocument (HYSerialize)

/**
 *  根据xml内容返回foundation对象
 *
 *  @return 返回foundation对象
 */
- (id)contentObject ;


/**
 *  检测data是否可解析，
 *
 *  @param data     待检测的data
 *  @param encoding 指定编码格式
 *
 *  @return 检测结果
 */
+ (BOOL)isValidForData:(NSData *)data encoding:(NSStringEncoding)encoding ;


+ (instancetype)parserXMLString:(NSString *)str error:(NSError *__autoreleasing *)error ;

+ (instancetype)parserXMLString:(NSString *)str encoding:(NSStringEncoding)encoding error:(NSError *__autoreleasing *)error ;

+ (id)parserData:(NSData *)data error:(NSError *__autoreleasing *)error ;

/**
 *  初始化
 *
 *
 *  @return
 */
+ (instancetype)parserData:(NSData *)data encoding:(NSStringEncoding)encoding error:(NSError *__autoreleasing *)error ;

@end
