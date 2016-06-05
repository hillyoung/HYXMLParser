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

@end
