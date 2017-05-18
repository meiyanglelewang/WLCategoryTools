//
//  UIViewController+WLViewController.h
//  Tuoke
//
//  Created by 王乐乐 on 2016/12/8.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WLViewController)


/**
 * @param title 导航条标题
 * @param titleColor 导航条标题颜色
 */
- (void)wl_navTitle:(NSString *)title titleColor:(UIColor *)titleColor;

/**
 *
 *  @param isShow 是否展示数据空白图片
 */
- (void)wl_showNoData:(BOOL)isShow;

/**
 *
 *  @param isShow 是否展示数据空白图片
 *  @param tapCallBack 点击回调
 */
- (void)wl_showNoData:(BOOL)isShow tapCallBack:(void(^)())tapCallBack;

/**
 *
 *  @param isShow 是否展示数据空白图片
 *  @param imageName 空白图片名字
 */
- (void)wl_showNoData:(BOOL)isShow imageName:(NSString *)imageName;

/**
 *
 *  @param isShow 是否展示数据空白图片
 *  @param imageName 空白图片名字
 *  @param tapCallBack 点击回调
 */
- (void)wl_showNoData:(BOOL)isShow imageName:(NSString *)imageName tapCallBack:(void(^)())tapCallBack;

/**
 *  push页面
 */
- (void)pushVC:(UIViewController *)vc;


/**
 *popToRoot页面
 */
- (void)popToRoot;

/**
 *返回任意一个页面
 */
- (void)popToViewControllerAtIndex:(NSInteger)index;

/**
 *  pop页面
 */
- (void)popTheVC;

/**
 *  pop到栈的第二个VC
 */
- (void)jumpTo1VC;


@end
