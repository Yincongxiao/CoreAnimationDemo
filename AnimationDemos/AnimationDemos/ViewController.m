//
//  ViewController.m
//  AnimationDemos
//
//  Created by 殷聪晓 on 2017/3/30.
//  Copyright © 2017年 SNAIL. All rights reserved.
//

#import "ViewController.h"
#import "CoreAnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)CMClicked:(UIButton *)sender {
    CoreAnimationViewController *am = [[CoreAnimationViewController alloc] initWithNibName:@"CoreAnimationViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:am animated:YES];
}

- (IBAction)ViewAnimationClicked:(UIButton *)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"name": @"xiaoming"};
    NSString *father = dic[@"father"];
    NSLog(@"%@",father);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *nextVC = segue.destinationViewController;
    if ([nextVC isKindOfClass:[CoreAnimationViewController class]]) {
        nextVC.title = @"CoreAnimations";
    }
}

@end
