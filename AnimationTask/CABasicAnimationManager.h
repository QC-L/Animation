//
//  CABasicAnimationManager.h
//  CAAnimationButton
//
//  Created by QC.L on 16/5/18.
//  Copyright © 2016年 QC.L. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kAnimationKeyPathCornerRadius;
extern NSString * const kAnimationKeyPathTransformScale;

@interface CABasicAnimationManager : NSObject

+ (CABasicAnimation *)animateWithKeyPath:(NSString *)keyPath
                                duration:(NSTimeInterval)duration
                                   delay:(NSTimeInterval)delay
                               fromValue:(id)fromValue
                                 toValue:(id)toValue;

+ (CABasicAnimation *)animateWithKeyPath:(NSString *)keyPath
                                duration:(NSTimeInterval)duration
                               fromValue:(id)fromValue
                                 toValue:(id)toValue;
@end
