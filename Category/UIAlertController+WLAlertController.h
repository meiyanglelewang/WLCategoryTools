//
//  UIAlertController+WLAlertController.h
//  Yunmafu
//
//  Created by 王乐乐 on 2017/2/23.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (WLAlertController)

/**
 *  alertView
 *  @param  nameArr 按钮的标题数组
 *  @param  title 提示框的标题
 *  @param  message 提示消息
 *  @param  callBack 点击回调包含index和内容
 *  @return return UIAlertController(AlertView)
 */
+ (nullable instancetype)wl_showAlertViewWithActionsName:(nonnull NSArray <NSString *> *)nameArr title:(nullable NSString *)title message:(nullable NSString *)message callBack:(void(^ __nullable)(NSString * _Nonnull btnTitle,NSInteger btnIndex))callBack;

/**
 *  actionSheet
 *  @param  nameArr 按钮的标题数组
 *  @param  callBack 点击回调包含index和内容
 *  @return return UIAlertController(ActionSheet)
 */
+ (nullable instancetype)wl_showActionSheetWithActionsName:(nonnull NSArray <NSString *> *)nameArr callBack:(void(^ __nullable)(NSString * __nullable btnTitle,NSInteger btnIndex))callBack;

@end
