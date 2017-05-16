//
//  CoreAnimationViewController.m
//  AnimationDemos
//
//  Created by 殷聪晓 on 2017/3/30.
//  Copyright © 2017年 SNAIL. All rights reserved.
//

#import "CoreAnimationViewController.h"

#define timg @"timg"
#define snail @"snail"

typedef enum : NSUInteger {
    cmFade = 0,                 //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
} animType;

@interface CoreAnimationViewController ()

@property (weak, nonatomic) IBOutlet UIView *amView;

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [self setAnimationViewBg];
}

- (void)setAnimationViewBg {
    static int8_t index = 0;
    if (index == 0) {
        _amView.layer.contents = (__bridge id)[UIImage imageNamed:timg].CGImage;
        index = 1;
    }
    if (index == 1) {
        _amView.layer.contents = (__bridge id)[UIImage imageNamed:snail].CGImage;
        index = 0;
    }
}

- (IBAction)animationButtonClicked:(UIButton *)amButton {

    NSString *subtypeString;
    static int8_t subtype = 0;
    switch (subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    subtype += 1;
    if (subtype > 3) {
        subtype = 0;
    }
    
    NSString *animationType = nil;
    switch (amButton.tag) {
        case cmFade:
            animationType = kCATransitionFade;
            break;
        case Push:
            animationType = kCATransitionPush;
            break;
        case Reveal:
            animationType = kCATransitionReveal;
            break;
        case MoveIn:
            animationType = kCATransitionMoveIn;
            break;
        case Cube:
            animationType = @"cube";
            break;
        case SuckEffect:
            animationType = @"suckEffect";
            break;
        case OglFlip:
            animationType = @"oglFlip";
            break;
        case RippleEffect:
            animationType = @"rippleEffect";
            break;
        case PageCurl:
            animationType = @"pageCurl";
            break;
        case PageUnCurl:
            animationType = @"pageUnCurl";
            break;
        case CameraIrisHollowOpen:
            animationType = @"cameraIrisHollowOpen";
            break;
        case CameraIrisHollowClose:
            animationType = @"cameraIrisHollowClose";
            break;
        default:
            break;
    }
    [self transitionWithType:animationType subType:subtypeString];
    [self setAnimationViewBg];
}

- (void)transitionWithType:(NSString *)tT subType:(NSString *)sT {
    CATransition *caT = [CATransition animation];
    caT.duration = 0.75;
    caT.type = tT;
    if (sT) caT.subtype = sT;
    caT.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    if ([tT isEqualToString:@"cameraIrisHollowOpen"] || [tT isEqualToString:@"cameraIrisHollowClose"]) {
        [self.view.layer addAnimation:caT forKey:@"animation"];
    }else {
        [_amView.layer addAnimation:caT forKey:@"animation"];
    }
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
