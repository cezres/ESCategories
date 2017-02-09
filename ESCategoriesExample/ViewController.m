//
//  ViewController.m
//  ESCategoriesExample
//
//  Created by 翟泉 on 2017/1/18.
//  Copyright © 2017年 翟泉. All rights reserved.
//

#import "ViewController.h"
#import "ESCategories.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"XXXX";
    
    ESNavigationBarButton *closeButton = [ESNavigationBarButton buttonWithTitle:@"关闭"];
    self.navigationItem.leftBarButtons = @[closeButton];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
