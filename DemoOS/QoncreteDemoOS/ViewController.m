//
//  ViewController.m
//  QoncreteDemoOS
//
//  Created by luo on 2016/12/12.
//  Copyright © 2016年 Goyoo. All rights reserved.
//

#import "ViewController.h"
#import "Qoncrete.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    Qoncrete *client = [Qoncrete sharedSingleton];
    client.sourceID = @"b4baaf8d-d771-406d-885d-5dd1fcb48823";
    client.apiToken = @"fdb6cabc-ad71-48a5-8f9d-56b2375acf16";
    client.errorLogger = ^(NSDictionary *err){
        NSLog(@"err: %@",err);
    };
    
    client.retryOnTimeout = 3;
    [client endConfig];
    
    for (int i = 0; i < 5; i ++) {
        [client send:@{@"name": [NSString stringWithFormat:@"client_OS_test_%d",i]}];
    }
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end