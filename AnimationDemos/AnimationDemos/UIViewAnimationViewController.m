//
//  UIViewAnimationViewController.m
//  AnimationDemos
//
//  Created by 殷聪晓 on 2017/3/30.
//  Copyright © 2017年 SNAIL. All rights reserved.
//

#import "UIViewAnimationViewController.h"
typedef enum : NSInteger {
    CurlDown = 0,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
} UIViewAnimationType;

@interface UIViewAnimationViewController ()
@property (strong, nonatomic) IBOutlet UIView *amView;

@end

@implementation UIViewAnimationViewController

- (void)viewDidLoad {
    [self setAnimationViewBg];
}

- (void)setAnimationViewBg {
    static int8_t index = 0;
    if (index == 0) {
        _amView.layer.contents = (__bridge id)[UIImage imageNamed:@"timg"].CGImage;
        index = 1;
    }
    if (index == 1) {
        _amView.layer.contents = (__bridge id)[UIImage imageNamed:@"snail"].CGImage;
        index = 0;
    }
}
- (IBAction)buttonClicked:(UIButton *)sender {
    UIViewAnimationTransition transition;
    switch (sender.tag) {
        case CurlDown:
            transition = UIViewAnimationTransitionCurlDown;
            break;
        case CurlUp:
            transition = UIViewAnimationTransitionCurlUp;
            break;
        case FlipFromLeft:
            transition = UIViewAnimationTransitionFlipFromLeft;
            break;
        case FlipFromRight:
            transition = UIViewAnimationTransitionFlipFromRight;            break;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationTransition:transition forView:_amView cache:NO];
    }];
    
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
