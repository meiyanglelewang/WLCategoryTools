//
//  UIView+WLView.h
//  Yunmafu
//
//  Created by 王乐乐 on 2017/3/20.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WLView)

/** 直接给View添加背景图片  如果要加手势事件可能有问题（待处理） */
@property (nonatomic, strong) NSString * wl_imageNamed;

/**
 圆角pt
 */
@property (nonatomic, assign) CGFloat wl_cornerRadius;

/**
 边框颜色
 */
@property (nonatomic, strong) UIColor * wl_boderColor;

/**
 边框宽度
 */
@property (nonatomic, assign) CGFloat wl_boderWith;
@end
