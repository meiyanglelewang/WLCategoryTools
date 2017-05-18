//
//  UINavigationController+WLNavigationController.h
//  Yunmafu
//
//  Created by 王乐乐 on 2017/4/5.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 转场动画type */ //可自定义扩展
typedef enum : NSUInteger {
    UINavigationViewTransitionTypeNone = 0,
    UINavigationViewTransitionTypeRight,
    UINavigationViewTransitionTypeLeft,
    UINavigationViewTransitionTypeTop,
    UINavigationViewTransitionTypeBottom
} UINavigationViewTransitionType;

/** 转场动画subType */ //可自定义扩展
typedef enum : NSUInteger {
    UINavigationViewTransitionSubTypeNone = 0,
    UINavigationViewTransitionSubTypeRight,
    UINavigationViewTransitionSubTypeLeft,
    UINavigationViewTransitionSubTypeTop,
    UINavigationViewTransitionSubTypeBottom
} UINavigationViewTransitionSubType;

@interface UINavigationController (WLNavigationController)

/** 压栈
 * @param viewController 压栈的VC
 * @param animated 是否有动画
 * @param transitionType 转场动画Type
 * @param transitionSubType 转场动画SubType
 */
- (void)wl_pushViewController:(UIViewController *)viewController animated:(BOOL)animated transitionType:(UINavigationViewTransitionType)transitionType transitionSubType:(UINavigationViewTransitionSubType)transitionSubType;

/** 出栈
 * @param animated 是否有动画
 * @param transitionType 转场动画Type
 * @param transitionSubType 转场动画SubType
 */
- (UIViewController*)wl_popViewControllerAnimated:(BOOL)animated transitionType:(UINavigationViewTransitionType)transitionType transitionSubType:(UINavigationViewTransitionSubType)transitionSubType;

@end
