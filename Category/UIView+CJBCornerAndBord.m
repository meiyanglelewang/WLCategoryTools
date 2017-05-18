//
//  UIView+CJBCornerAndBord.m
//  Yunmafu
//
//  Created by 炳神 on 2017/2/16.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "UIView+CJBCornerAndBord.h"

@implementation UIView (CJBCornerAndBord)

- (void)addCorner:(CGFloat)corner{
    self.layer.cornerRadius = corner;
    self.layer.masksToBounds = YES;
}

- (void)addBordWidth:(CGFloat)width bordColor:(UIColor *)bordColor{
    self.layer.borderColor = bordColor.CGColor;
    self.layer.borderWidth = width;
}


@end
