//
//  ViewController.m
//  WZHAnmation
//
//  Created by wzh on 2017/7/18.
//  Copyright © 2017年 wzh. All rights reserved.
//

#import "ViewController.h"
#import "WZHAnimationView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)start:(id)sender {
    
    [WZHAnimationView showInView:self.view];
}
- (IBAction)end:(id)sender {
    
    [WZHAnimationView dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
