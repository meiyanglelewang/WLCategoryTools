//
//  UITextField+WLTextField.m
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "UITextField+WLTextField.h"
#import <objc/runtime.h>

@implementation UITextField (WLTextField)

static NSString * const WLPlaceholderColorKey = @"placeholderLabel.textColor";


const char kPropertyIdentificationKey_leftText;//左边文字


/** 占位文字颜色 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    // 提前设置占位文字, 目的 : 让它提前创建placeholderLabel
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    
    // 恢复到默认的占位文字颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:WLPlaceholderColorKey];
}
- (UIColor *)placeholderColor{
    return [self valueForKeyPath:WLPlaceholderColorKey];
}

/** leftView 文字形式 默认(CGRect){{12,0},{103,self.height}} */
- (void)setWl_leftText:(NSString *)wl_leftText{
    objc_setAssociatedObject(self,@selector(wl_leftText), wl_leftText, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UILabel * lab = [[UILabel alloc] initWithFrame:(CGRect){{kPaddingValue,0},{kTFLeftViewWidth,self.frame.size.height}}];
    lab.text = wl_leftText;
    lab.font = Font(kTFFontSize);
    lab.textAlignment = NSTextAlignmentCenter;
    self.leftView = lab;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (NSString *)wl_leftText{
    return objc_getAssociatedObject(self, @selector(wl_leftText));
}

/** leftView 图片形式(图片名字) 默认(CGRect){{6,0},{51.5,self.height}} */
- (void)setWl_leftImageName:(NSString *)wl_leftImageName{
    objc_setAssociatedObject(self, @selector(wl_leftImageName), wl_leftImageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIView * leftView = [[UIView alloc] initWithFrame:(CGRect){{kPaddingValue/2,0},{kTFLeftViewWidth/2,self.frame.size.height}}];
    UIImageView * imV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:wl_leftImageName]];
    imV.center = leftView.center;
    imV.bounds = (CGRect){{0,0},{CGRectGetWidth(leftView.frame)/2,self.frame.size.height/2}};
    [leftView addSubview:imV];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (NSString *)wl_leftImageName{
    return objc_getAssociatedObject(self, @selector(wl_leftImageName));
}

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
+ (UITextField *)wl_getTFWithleftViewWithFrame:(CGRect)rect leftText:(NSString *)leftText keyBoardType:(UIKeyboardType)keyboardType isSecurity:(BOOL)security placeholder:(NSString *)placeholder{
    UITextField * TF = [UITextField new];
    UILabel * lab = [[UILabel alloc] initWithFrame:rect];
    lab.text = leftText;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = Font(kTFFontSize);
    TF.leftView = lab;
    TF.secureTextEntry = security;
    TF.keyboardType = keyboardType;
    TF.placeholder = placeholder;
    TF.font = Font(kTFFontSize);
    TF.backgroundColor = [UIColor whiteColor];
    TF.leftViewMode = UITextFieldViewModeAlways;
    return TF;
}

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
+ (UITextField *)wl_getTFWithleftImageWithFrame:(CGRect)rect leftImageName:(NSString *)leftImageName keyBoardType:(UIKeyboardType)keyboardType isSecurity:(BOOL)security placeholder:(NSString *)placeholder{
    UITextField * TF = [UITextField new];
    UIView * leftView = [[UIView alloc] initWithFrame:(CGRect){{rect.origin.x/2,0},{rect.size.width/2,rect.size.height}}];
    UIImageView * imV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftImageName]];
    imV.center = leftView.center;
    imV.bounds = (CGRect){{0,0},{CGRectGetWidth(leftView.frame)/2,rect.size.height/2}};
    [leftView addSubview:imV];
    TF.leftView = leftView;
    TF.leftViewMode = UITextFieldViewModeAlways;
    return TF;
}

@end
