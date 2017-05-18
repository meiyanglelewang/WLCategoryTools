//
//  NSObject+WLObject.h
//  Yunmafu
//
//  Created by 王乐乐 on 2017/2/21.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WLObject)

#pragma mark ___RuntimeKit___
/**
 *  runtime替换实例函数
 */
+ (void)wl_exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2;

/**
 *  runtime替换静态函数
 */
+ (void)wl_exchangeClassMethod1:(SEL)method1 method2:(SEL)method2;

#pragma mark ___RuntimeKit___

/**
 *  获取当前显示的viewcontroller
 *
 *  @return return 当前显示的vc
 */
+ (UIViewController *)obtainTopViewController;

/**
 *  获取当前显示的viewcontroller
 *
 *  @return return 当前显示的vc
 */
- (UIViewController *)obtainTopViewController;



/** 拨打电话 */
- (void)wl_callTelPhone:(NSString *)phoneNumber;

@end
