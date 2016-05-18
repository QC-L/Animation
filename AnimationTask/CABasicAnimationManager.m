//
//  CABasicAnimationManager.m
//  CAAnimationButton
//
//  Created by QC.L on 16/5/18.
//  Copyright © 2016年 QC.L. All rights reserved.
//

#import "CABasicAnimationManager.h"

NSString * const kAnimationKeyPathCornerRadius = @"cornerRadius";
NSString * const kAnimationKeyPathTransformScale = @"transform.scale";


@implementation CABasicAnimationManager

+ (CABasicAnimation *)animateWithKeyPath:(NSString *)keyPath
                                duration:(NSTimeInterval)duration
                                   delay:(NSTimeInterval)delay
                               fromValue:(id)fromValue
                                 toValue:(id)toValue {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.duration = duration;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.beginTime = CACurrentMediaTime() + delay;
    animation.removedOnCompletion = YES;
    return animation;
}

+ (CABasicAnimation *)animateWithKeyPath:(NSString *)keyPath duration:(NSTimeInterval)duration fromValue:(id)fromValue toValue:(id)toValue {
    return [self animateWithKeyPath:keyPath duration:duration delay:0 fromValue:fromValue toValue:toValue];
}

@end
