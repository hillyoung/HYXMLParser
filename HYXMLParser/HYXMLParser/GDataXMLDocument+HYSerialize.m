//
//  GDataXMLDocument+HYSerialize.m
//  HYXMLParser
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 SimonYoung. All rights reserved.
//

#import "GDataXMLDocument+HYSerialize.h"
#import <objc/runtime.h>

@interface GDataXMLDocument ()

/**
 *  是否自动添加根节点
 */
@property (nonatomic) BOOL autoAddRootElement;
@property (strong, nonatomic) NSArray *arrayTitles;

@end

@implementation GDataXMLDocument (HYSerialize)

#pragma mark - LifeCycle

+ (instancetype)parserXMLString:(NSString *)str error:(NSError *__autoreleasing *)error arrayTitles:(NSArray *)arrayTitles {
    return [GDataXMLDocument parserXMLString:str encoding:NSUTF8StringEncoding error:error arrayTitles:arrayTitles];
}

+ (instancetype)parserXMLString:(NSString *)str encoding:(NSStringEncoding)encoding error:(NSError *__autoreleasing *)error arrayTitles:(NSArray *)arrayTitles {
    NSData *data = [str dataUsingEncoding:encoding];
    return [GDataXMLDocument parserData:data encoding:encoding error:error arrayTitles:arrayTitles];
}


+ (id)parserData:(NSData *)data error:(NSError *__autoreleasing *)error arrayTitles:(NSArray *)arrayTitles {
    return [GDataXMLDocument parserData:data encoding:NSUTF8StringEncoding error:error arrayTitles:arrayTitles];
}

+ (instancetype)parserData:(NSData *)data encoding:(NSStringEncoding)encoding error:(NSError *__autoreleasing *)error arrayTitles:(NSArray *)arrayTitles {
    NSData *parserData = data;

    if (![GDataXMLDocument isValidForData:data encoding:encoding]) {
        NSMutableString *xmlStr = [[NSMutableString alloc] initWithData:data encoding:encoding];

        NSRange rang = [xmlStr rangeOfString:@"?>"];

        if (rang.length) {

            [xmlStr insertString:@"<body>" atIndex:rang.location+rang.length];
            [xmlStr insertString:@"</body>" atIndex:xmlStr.length];

        } else {
            xmlStr = [NSMutableString stringWithFormat:@"<body>%@</body>", xmlStr];
        }

        parserData = [xmlStr dataUsingEncoding:encoding];
    }

    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:parserData error:error];
    document.arrayTitles = arrayTitles;
    document.autoAddRootElement = ![GDataXMLDocument isValidForData:data encoding:encoding];

    return document;
}

#pragma mark - Message

- (id)contentObject {
    if (![self XMLData].length) {
        return nil;
    }

    id content = [self parserElement:self.rootElement];

    if (self.autoAddRootElement) {
        return content;
    }

    return @{self.rootElement.name: content};
}

+ (BOOL)isValidForData:(NSData *)data encoding:(NSStringEncoding)encoding {

    const char *baseURL = NULL;

    const char *xmlEncoding = IANAEncodingCStringFromNSStringEncoding(encoding);

    // NOTE: We are assuming [data length] fits into an int.
    xmlDoc *xmlDoc = xmlReadMemory((const char*)[data bytes], (int)[data length], baseURL, xmlEncoding,(XML_PARSE_NOCDATA | XML_PARSE_NOBLANKS));

    if (xmlDoc == NULL) {
        free(xmlDoc);
        return NO;
    }

    return YES;
}

#pragma mark - Private

/**
 *  解析节点
 *
 *  @return 返回解析得到的对象
 */
- (id)parserElement:(GDataXMLElement *)element {
    NSMutableDictionary *content = [NSMutableDictionary dictionary];

    NSArray *childrenElements = element.children;

    if (!childrenElements.count) {
        return nil;
    }

    if (childrenElements.count == 1 &&
        [[childrenElements.firstObject name] isEqualToString:@"text"]) {
        return element.stringValue;
    } else {
        [childrenElements enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GDataXMLElement *childrenElement = (GDataXMLElement *)obj;


            id value = [content objectForKey:childrenElement.name];

            if (value) {


                if (![value isKindOfClass:[NSMutableArray class]]) {
                    NSMutableArray *array = [NSMutableArray arrayWithObject:value];
                    [content setValue:array forKey:childrenElement.name];
                    value = [content objectForKey:childrenElement.name];
                }

                //递归算法,获取子节点对应的对象
                [value addObject:[self parserElement:childrenElement]];

            } else {
                //递归算法获取对应的值

                if ([self.arrayTitles containsObject:childrenElement.name]) {
                    NSMutableArray *array = [@[[self parserElement:childrenElement]] mutableCopy];
                    [content setValue:array forKey:childrenElement.name];
                } else {
                    [content setValue:[self parserElement:childrenElement] forKey:childrenElement.name];
                }

            }
            
        }];
    }

    return content;
}

#pragma mark - Setter && Getter

char const *Key_AutoAddRootElment = "autoAddRootElement";
- (void)setAutoAddRootElement:(BOOL)autoAddRootElement {
    objc_setAssociatedObject(self, Key_AutoAddRootElment, @(autoAddRootElement), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)autoAddRootElement {

    NSNumber *number = objc_getAssociatedObject(self, Key_AutoAddRootElment);

    if (!number) {
        return NO;
    }

    return number.boolValue;
}

char const *Key_ArrayTitles = "arrayTitles" ;
- (void)setArrayTitles:(NSArray *)arrayTitles {
    objc_setAssociatedObject(self, Key_ArrayTitles, arrayTitles, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)arrayTitles {
    return objc_getAssociatedObject(self, Key_ArrayTitles);
}

@end
