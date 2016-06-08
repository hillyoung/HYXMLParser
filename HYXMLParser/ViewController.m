//
//  ViewController.m
//  HYXMLParser
//
//  Created by luculent on 16/6/2.
//  Copyright © 2016年 SimonYoung. All rights reserved.
//

#import "ViewController.h"
#import "XMLReader.h"
#import "GDataXMLDocument+HYSerialize.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchParserButton:(id)sender {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NoStandardData" ofType:nil];

    NSData *data = [NSData dataWithContentsOfFile:filePath];

    NSError *error = nil;
//    id Info = [XMLReader dictionaryForXMLData:data error:&error];

    if (error) {
        NSLog(@"%@", error);
    }

    error = nil;


    GDataXMLDocument *document = [GDataXMLDocument parserData:data error:&error arrayTitles:@[@"note", @"note1"]];

    if (error) {
        NSLog(@"%@", error);
    }


    id contentObject = [document contentObject];

    NSData *contentData = [NSJSONSerialization dataWithJSONObject:contentObject options:NSJSONWritingPrettyPrinted error:&error];

    NSString *string = [contentObject description];

    string = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];


    self.textView.text = [[NSString alloc] initWithData:contentData encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"%@", @"");

}

@end
