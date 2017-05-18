//
//  UIView+YMFProgressHud.m
//  Yunmafu
//
//  Created by 炳神 on 2017/4/27.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "UIView+YMFProgressHud.h"

@implementation UIView (YMFProgressHud)
- (void)progress:(NSString *)str{
    [MBProgressHUD hideHUDForView:self animated:YES];
    [SVProgressHUD showInfoWithStatus:str];
    [SVProgressHUD dismissWithDelay:1.5];
}

- (void)svpPress:(NSString *)str{
    [SVProgressHUD showInfoWithStatus:str];
    [SVProgressHUD dismissWithDelay:1.5];
}
@end
