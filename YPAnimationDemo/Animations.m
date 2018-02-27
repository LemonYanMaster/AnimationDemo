//
//  Animations.m
//  YPAnimationDemo
//
//  Created by pengpeng yan on 16/3/21.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import "Animations.h"

@interface Animations ()

@end

@implementation Animations

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)zoomInView:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait{
    __block BOOL done = wait;
    view.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:duration animations:^{
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        done = NO;
    }];
    while (done == YES)
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (void)fadeInView:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait{
    __block BOOL done = wait;
    [view setAlpha:0.0];
    [UIView animateWithDuration:duration animations:^{
        [view setAlpha:0.5];
    } completion:^(BOOL finished) {
        done = NO;
    }];
}

+ (void)fadeOutView:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait{
    __block BOOL done = wait;
    [view setAlpha:1.0];
    [UIView animateWithDuration:duration animations:^{
        [view setAlpha:0.0];
    } completion:^(BOOL finished) {
        done = NO;
    }];
}

+ (void)movedownView:(UIView *)view andAnimationDuration:(float)duration Wait:(BOOL)wait andLength:(float)length{
    __block BOOL done = wait;
    [UIView animateWithDuration:duration animations:^{
        view.center = CGPointMake(view.center.x, view.center.y - length);
    } completion:^(BOOL finished) {
        done = NO;
    }];

}

+ (void)rotateView:(UIView *)view andAnimationDuration:(float)durtation wait:(BOOL)wait andAngle:(float)angle{
    __block BOOL done = wait;
    [UIView animateWithDuration:durtation animations:^{
        view.transform = CGAffineTransformMakeRotation(M_PI * angle / 180.0);
    } completion:^(BOOL finished) {
        done = NO;
    }];

}












@end
