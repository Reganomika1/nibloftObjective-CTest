//
//  TabBarController.m
//  TestProgect
//
//  Created by Разработчик on 14.01.2018.
//  Copyright © 2018 Il. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()<UITabBarControllerDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *mapVC = [st instantiateViewControllerWithIdentifier:@"weather"];
    HistoryViewController*historyVC = [st instantiateViewControllerWithIdentifier:@"history"];
    historyVC.weatherDelegate = mapVC;
    
    self.viewControllers = @[mapVC,historyVC];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
