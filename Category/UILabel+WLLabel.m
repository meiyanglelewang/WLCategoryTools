//
//  UILabel+WLLabel.m
//  Yunmafu
//
//  Created by 王乐乐 on 2017/3/29.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "UILabel+WLLabel.h"

@implementation UILabel (WLLabel)
//////////////////////////////////////////////////////////////////////////////////////////////内存错误 --死循环--待处理
/*
+ (void)load{
    method_exchangeImplementations(class_getInstanceMethod([UILabel class], @selector(drawTextInRect:)), class_getInstanceMethod([UILabel class], @selector(wl_drawTextInRect:)));

    method_exchangeImplementations(class_getInstanceMethod([UILabel class], @selector(textRectForBounds:limitedToNumberOfLines:)), class_getInstanceMethod([UILabel class], @selector(wl_textRectForBounds:limitedToNumberOfLines:)));
}


- (void)setWl_topSapce:(CGFloat)wl_topSapce{
    objc_setAssociatedObject(self, @selector(wl_topSapce), [NSNumber numberWithFloat:wl_topSapce], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wl_topSapce{
    NSNumber * temp = objc_getAssociatedObject(self, @selector(wl_topSapce));
    if (!temp) temp = @(0);
    return temp.floatValue;
}


- (void)setWl_leftSapce:(CGFloat)wl_leftSapce{
    objc_setAssociatedObject(self, @selector(wl_leftSapce), [NSNumber numberWithFloat:wl_leftSapce], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wl_leftSapce{
    NSNumber * temp = objc_getAssociatedObject(self, @selector(wl_leftSapce));
    if (!temp) temp = @(0);
    return temp.floatValue;
}


- (void)setWl_bottomSapce:(CGFloat)wl_bottomSapce{
    objc_setAssociatedObject(self, @selector(wl_bottomSapce), [NSNumber numberWithFloat:wl_bottomSapce], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wl_bottomSapce{
    NSNumber * temp = objc_getAssociatedObject(self,@selector(wl_bottomSapce));
    if (!temp) temp = @(0);
    return temp.floatValue;
}


- (void)setWl_rightSapce:(CGFloat)wl_rightSapce{
    objc_setAssociatedObject(self, @selector(wl_rightSapce), [NSNumber numberWithFloat:wl_rightSapce], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wl_rightSapce{
    NSNumber * temp = objc_getAssociatedObject(self, @selector(wl_rightSapce));
    if (!temp) temp = @(0);
    return temp.floatValue;
}


- (void)wl_setEdgeInsetWithTop:(CGFloat)topSapce left:(CGFloat)leftSpace bottom:(CGFloat)bottomSpace right:(CGFloat)rightSpace{
    self.wl_topSapce = topSapce;
    self.wl_leftSapce = leftSpace;
    self.wl_bottomSapce = bottomSpace;
    self.wl_rightSapce = rightSpace;
}

/////////////////////////////////////////////////////////////////////////////////////////
- (void)wl_drawTextInRect:(CGRect)rect{
    [self drawTextInRect:UIEdgeInsetsInsetRect(rect, (UIEdgeInsets){self.wl_topSapce,self.wl_leftSapce,self.wl_bottomSapce,self.wl_rightSapce})];
}
/////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)wl_textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines{
    CGRect rect = [self wl_textRectForBounds:UIEdgeInsetsInsetRect(bounds,(UIEdgeInsets){self.wl_topSapce,self.wl_leftSapce,self.wl_bottomSapce,self.wl_rightSapce}) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.wl_leftSapce;
    rect.origin.y -= self.wl_topSapce;
    rect.size.width += self.wl_leftSapce + self.wl_rightSapce;
    rect.size.height += self.wl_topSapce + self.wl_bottomSapce;
    return rect;
}
*/
//////////////////////////////////////////////////////////////////////////////////////////////内存错误 --死循环--待处理

@end
