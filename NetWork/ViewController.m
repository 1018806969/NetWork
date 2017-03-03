//
//  ViewController.m
//  NetWork
//
//  Created by txx on 17/3/2.
//  Copyright © 2017年 txx. All rights reserved.
//

#import "ViewController.h"
#import "RequestApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)login:(UIButton *)sender {
    
    NSDictionary *param = @{@"phone":@"15972615939",@"password":@"123456",@"loginType":@"1"};
    [RequestApi loginWithParam:param scc:^(id response) {
        
    }];
}
- (IBAction)order:(UIButton *)sender {
    [RequestApi orderListPage:1 limit:3 scc:^(id response) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
