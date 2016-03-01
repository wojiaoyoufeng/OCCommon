//
//  ViewController.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/2/29.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *美美的;
@property (weak, nonatomic) UITableView * tablview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.width = 100;
    self.view.centerX = 100;
    self.view.top = 100;
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
