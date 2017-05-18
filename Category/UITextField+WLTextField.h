//
//  UITextField+WLTextField.h
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (WLTextField)

/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

/** leftView 文字形式 默认(CGRect){{12,0},{103,self.height}} */
@property (nonatomic, strong) NSString * wl_leftText;

/** leftView 图片形式(图片名字) 默认(CGRect){{12,0},{103,self.height}} */
@property (nonatomic, strong) NSString * wl_leftImageName;


/**
 *  生成UITextField (文字形式）
 *
 *  @param rect  左边提示位置
 *  @param leftText    左边文字
 *  @param keyboardType   键盘类型
 *  @param security       是否安全输入
 *  @param placeholder      placeHolder
 *  @return UITextField
 */
+ (UITextField *)wl_getTFWithleftViewWithFrame:(CGRect)rect leftText:(NSString *)leftText keyBoardType:(UIKeyboardType)keyboardType isSecurity:(BOOL)security placeholder:(NSString *)placeholder;


/**
 *  生成UITextField (图片形式）
 *
 *  @param rect  左边提示位置
 *  @param leftImageName  左边图片名字
 *  @param keyboardType   键盘类型
 *  @param security       是否安全输入
 *  @param placeholder      placeHolder
 *  @return UITextField
 */
+ (UITextField *)wl_getTFWithleftImageWithFrame:(CGRect)rect leftImageName:(NSString *)leftImageName keyBoardType:(UIKeyboardType)keyboardType isSecurity:(BOOL)security placeholder:(NSString *)placeholder;
@end
