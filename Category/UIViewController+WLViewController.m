//
//  UIViewController+WLViewController.m
//  Tuoke
//
//  Created by 王乐乐 on 2016/12/8.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "UIViewController+WLViewController.h"
#import "BaseButton.h"


static BaseButton * WLViewControllerNoDataViewButton = nil;


@implementation UIViewController (WLViewController)

/**
 * @param title 导航条标题
 * @param titleColor 导航条标题颜色
 */
- (void)wl_navTitle:(NSString *)title titleColor:(UIColor *)titleColor{
    if (self.navigationController) {
        self.navigationItem.title = title;
        self.navigationController.navigationBar .titleTextAttributes = @{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:Font(16)};
    }else{
        WLog(@"%@不存在导航条",self);
    }
}


/**
 *
 *  @param isShow 是否展示数据空白图片
 */
- (void)wl_showNoData:(BOOL)isShow{
    [self wl_showNoData:isShow imageName:nil tapCallBack:nil];
}

/**
 *
 *  @param isShow 是否展示数据空白图片
 *  @param tapCallBack 点击回调
 */
- (void)wl_showNoData:(BOOL)isShow tapCallBack:(void(^)())tapCallBack{
    [self wl_showNoData:isShow imageName:nil tapCallBack:tapCallBack];
}

/**
 *
 *  @param isShow 是否展示数据空白图片
 *  @param imageName 空白图片名字
 */
- (void)wl_showNoData:(BOOL)isShow imageName:(NSString *)imageName{
    [self wl_showNoData:isShow imageName:imageName tapCallBack:nil];
}

/**
 *
 *  @param isShow 是否展示数据空白图片
 *  @param imageName 空白图片名字
 *  @param tapCallBack 点击回调
 */
- (void)wl_showNoData:(BOOL)isShow imageName:(NSString *)imageName tapCallBack:(void(^)())tapCallBack{
    if (imageName.length < 1) WLog(@"默认图片");
    if (isShow) {
        if (!WLViewControllerNoDataViewButton) {
            WLViewControllerNoDataViewButton = [BaseButton buttonWithType:UIButtonTypeCustom];
            WLViewControllerNoDataViewButton.frame = self.view.bounds;
            WLViewControllerNoDataViewButton.backgroundColor = [UIColor blueColor];
            if (tapCallBack) {
                [[WLViewControllerNoDataViewButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                    tapCallBack();
                }];
            }
        }
        [WLViewControllerNoDataViewButton setBackgroundImage:ImageNamed(imageName.length<1?@"no-messge":imageName) forState:0];
        [self.view addSubview:WLViewControllerNoDataViewButton];
    }else{
        [WLViewControllerNoDataViewButton removeFromSuperview] ;
        WLViewControllerNoDataViewButton = nil ;
    }
}

/**
 *  push页面
 */
- (void)pushVC:(UIViewController *)vc{
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *返回任意一个页面
 */
- (void)popToViewControllerAtIndex:(NSInteger)index{
    if (self.navigationController.viewControllers.count > index) {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index] animated:YES];
    }
}

/**
 *popToRoot页面
 */
- (void)popToRoot{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/**
 *  pop页面
 */
- (void)popTheVC{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/**
 *  pop到栈的第二个VC
 */
- (void)jumpTo1VC{
    [self popToViewControllerAtIndex:1];
}


@end
