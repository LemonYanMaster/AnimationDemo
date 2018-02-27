//
//  Animations.h
//  YPAnimationDemo
//
//  Created by pengpeng yan on 16/3/21.
//  Copyright © 2016年 peng yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Animations : UIViewController

+ (void)zoomInView:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait;

+ (void)fadeInView:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait;

+ (void)fadeOutView:(UIView *)view andAnimationDuration:(float)duration andWait:(BOOL)wait;

+ (void)movedownView:(UIView *)view andAnimationDuration:(float)duration Wait:(BOOL)wait andLength:(float)length;

+ (void)rotateView:(UIView *)view andAnimationDuration:(float)durtation wait:(BOOL)wait andAngle:(float)angle;

@end
