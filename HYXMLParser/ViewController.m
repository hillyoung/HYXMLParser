//
//  ViewController.m
//  HYXMLParser
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 SimonYoung. All rights reserved.
//

#import "ViewController.h"
#import "XMLReader.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NoStandardData" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    id Info = [XMLReader dictionaryForXMLData:data error:&error];
    
    if (error) {
        NSLog(@"%@", error);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
