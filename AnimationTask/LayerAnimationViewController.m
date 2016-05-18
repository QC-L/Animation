//
//  LayerAnimationViewController.m
//  AnimationTask
//
//  Created by QC.L on 16/5/18.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "LayerAnimationViewController.h"
#import "CABasicAnimationManager.h"

static NSTimeInterval const kAnimationDuration = 0.3;
static CGFloat const kButtonSourceScale = 1;
static CGFloat const kButtonTargetScale = 0.3;
static CGFloat const kButtonSourceCornerRadius = 50;
static CGFloat const kButtonTargetCornerRadius = 10;

@interface LayerAnimationViewController () {
    BOOL isClicked;
}
@property (nonatomic, strong) UIButton *recordButton;
@end

@implementation LayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    isClicked = NO;
    
    self.recordButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _recordButton.backgroundColor = [UIColor redColor];
    _recordButton.frame = CGRectMake(0, 0, 100, 100);
    _recordButton.center = self.view.center;
    _recordButton.layer.cornerRadius = kButtonSourceCornerRadius;
    [_recordButton addTarget:self action:@selector(recordAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_recordButton];
    
}

- (void)recordAction:(UIButton *)sender {
    if (!isClicked) {
        
        CABasicAnimation *cornerRadiusAnimation = [CABasicAnimationManager
                                                   animateWithKeyPath:kAnimationKeyPathCornerRadius
                                                   duration:kAnimationDuration
                                                   fromValue:@(kButtonSourceCornerRadius)
                                                   toValue:@(kButtonTargetCornerRadius)];
        CABasicAnimation *transformScaleAnimation = [CABasicAnimationManager
                                                     animateWithKeyPath:kAnimationKeyPathTransformScale
                                                     duration:kAnimationDuration
                                                     fromValue:@(kButtonSourceScale)
                                                     toValue:@(kButtonTargetScale)];
        
        [sender.layer addAnimation:cornerRadiusAnimation forKey:@"cornerRadiusAnimation"];
        [sender.layer addAnimation:transformScaleAnimation forKey:@"transformScaleAnimation"];
        sender.layer.cornerRadius = kButtonTargetCornerRadius;
        sender.layer.transform = CATransform3DMakeScale(kButtonTargetScale, kButtonTargetScale, kButtonTargetScale);
    } else {
        
        CABasicAnimation *cornerRadiusAnimation = [CABasicAnimationManager
                                                   animateWithKeyPath:kAnimationKeyPathCornerRadius
                                                   duration:kAnimationDuration
                                                   fromValue:@(kButtonTargetCornerRadius)
                                                   toValue:@(kButtonSourceCornerRadius)];
        CABasicAnimation *transformScaleAnimation = [CABasicAnimationManager
                                                     animateWithKeyPath:kAnimationKeyPathTransformScale
                                                     duration:kAnimationDuration
                                                     fromValue:@(kButtonTargetScale)
                                                     toValue:@(kButtonSourceScale)];
        
        [sender.layer addAnimation:cornerRadiusAnimation forKey:@"cornerRadiusAnimation"];
        [sender.layer addAnimation:transformScaleAnimation forKey:@"transformScaleAnimation"];
        sender.layer.cornerRadius = kButtonSourceCornerRadius;
        sender.layer.transform = CATransform3DMakeScale(kButtonSourceScale, kButtonSourceScale, kButtonSourceScale);
    }
    isClicked = !isClicked;

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
