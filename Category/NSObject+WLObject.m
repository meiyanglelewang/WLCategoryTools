//
//  NSObject+WLObject.m
//  Yunmafu
//
//  Created by 王乐乐 on 2017/2/21.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "NSObject+WLObject.h"

@implementation NSObject (WLObject)

#pragma mark ___RuntimeKit___
+ (void)wl_exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

+ (void)wl_exchangeClassMethod1:(SEL)method1 method2:(SEL)method2{
    method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}



#pragma mark ___RuntimeKit___

/**
 *  获取当前显示的viewcontroller
 *
 *  @return return 当前显示的vc
 */
+ (UIViewController *)obtainTopViewController{
    return [[UIViewController new] obtainTopViewController];
}

/**
 *  获取当前显示的viewcontroller
 *
 *  @return return 当前显示的vc
 */
- (UIViewController *)obtainTopViewController{
    return [self obtainTopViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}
- (UIViewController*)obtainTopViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self obtainTopViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self obtainTopViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self obtainTopViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

/** 拨打电话 */
- (void)wl_callTelPhone:(NSString *)phoneNumber{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]];
}

@end
