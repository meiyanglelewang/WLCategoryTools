//
//  UINavigationBar+WLNavigationBar.m
//  Yunmafu
//
//  Created by 王乐乐 on 2017/3/17.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "UINavigationBar+WLNavigationBar.h"
#import <objc/runtime.h>

@implementation UINavigationBar (WLNavigationBar)

- (void)setWl_bgColor:(UIColor *)wl_bgColor{
    objc_setAssociatedObject(self, @selector(wl_bgColor), wl_bgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBackgroundImage:[UIImage imageWithColor:wl_bgColor] forBarMetrics:UIBarMetricsDefault];
}

- (UIColor *)wl_bgColor{
   return objc_getAssociatedObject(self, @selector(wl_bgColor));
}
@end
