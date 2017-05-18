//
//  UINavigationController+WLNavigationController.m
//  Yunmafu
//
//  Created by 王乐乐 on 2017/4/5.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "UINavigationController+WLNavigationController.h"

@implementation UINavigationController (WLNavigationController)

/**
 * @param viewController 压栈的VC
 * @param animated 是否有动画
 * @param transitionType 转场动画Type
 * @param transitionSubType 转场动画SubType
 */
- (void)wl_pushViewController:(UIViewController *)viewController animated:(BOOL)animated transitionType:(UINavigationViewTransitionType)transitionType transitionSubType:(UINavigationViewTransitionSubType)transitionSubType{
    
    [self pushViewController:viewController animated:NO];
    if (animated) {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
//        transition.subtype = [self findTransitonType:theTransition]?:kCATransitionFromRight;
        [self.view.layer addAnimation:transition forKey:nil];
    }
}

/** 出栈
 * @param animated 是否有动画
 * @param transitionType 转场动画Type
 * @param transitionSubType 转场动画SubType
 */
- (UIViewController*)wl_popViewControllerAnimated:(BOOL)animated transitionType:(UINavigationViewTransitionType)transitionType transitionSubType:(UINavigationViewTransitionSubType)transitionSubType{
    UIViewController *tempVC = [self popViewControllerAnimated:NO];
    if (animated) {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
//        transition.subtype = [self findTransitonType:theTransition]?:kCATransitionFromLeft;
        //        transition.delegate = self;
        [self.view.layer addAnimation:transition forKey:nil];
    }
    return tempVC;
}


@end
