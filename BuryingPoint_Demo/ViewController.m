//
//  ViewController.m
//  BuryingPoint_Demo
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "ViewController.h"

#import "MJLFirstViewController.h"

//用户行为统计==俗称埋点
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)jumpBtn:(id)sender {
    MJLFirstViewController *fitstVC = [[MJLFirstViewController alloc]init];
    [self.navigationController pushViewController:fitstVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
