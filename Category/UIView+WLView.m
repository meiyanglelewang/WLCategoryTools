//
//  UIView+WLView.m
//  Yunmafu
//
//  Created by 王乐乐 on 2017/3/20.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "UIView+WLView.h"
#import <objc/runtime.h>

@implementation UIView (WLView)

- (void)setWl_imageNamed:(NSString *)wl_imageNamed{
    if (! wl_imageNamed.length) {
        NSLog(@"设置view的图片名字为空");
    }
    objc_setAssociatedObject(self, @selector(wl_imageNamed), wl_imageNamed, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:wl_imageNamed].CGImage);
}

- (NSString *)wl_imageNamed{
    return objc_getAssociatedObject(self, @selector(wl_imageNamed));
}


- (void)setWl_cornerRadius:(CGFloat)wl_cornerRadius{
    self.layer.cornerRadius = wl_cornerRadius;
}

- (CGFloat)wl_cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setWl_boderColor:(UIColor *)wl_boderColor{
    self.layer.borderColor = wl_boderColor.CGColor;
}

- (UIColor *)wl_boderColor{
    return (UIColor *)self.layer.borderColor;
}

- (void)setWl_boderWith:(CGFloat)wl_boderWith{
    self.layer.borderWidth = wl_boderWith;
}

- (CGFloat)wl_boderWith{
    return self.layer.borderWidth;
}

@end
