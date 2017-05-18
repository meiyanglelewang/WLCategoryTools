//
//  NSString+WLString.h
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WLString)

/**
 *  根据文件路径计算文件或者文件夹大小
 */
- (unsigned long long)wl_fileSize;

/**正则匹配邮箱号*/
- (BOOL)checkMailInput;

/**正则匹配手机号*/
- (BOOL)checkTelNumber;

/**正则匹配用户身份证号*/
- (BOOL)checkUserIdCard;

/**正则匹配银行卡号是否正确*/
- (BOOL) checkBankNumber;

/**正则匹配URL*/
- (BOOL)checkURL;

/**正则只能输入数字和字母*/
- (BOOL) checkTeshuZifuNumber;

/**截取字符串后四位*/
- (NSString *)cutOutStrWith:(NSString *)str;

/**手机号加密处理*/
- (NSString *)phoneNumberEncryptionWith:(NSString *)str;

/**身份证号加密处理*/
- (NSString *)idCardNumberEncryptionWith:(NSString *)str;

/**姓名加密处理*/
+ (NSString *)nameEncryptionWith:(NSString *)str;

/**银行卡号加密处理*/
+ (NSString *)bankCardNumberEncryptionWith:(NSString *)str;
/** 价格减一 */
+ (NSString *)priceReduceWith:(NSString *)str;

/** 价格加一 */
+ (NSString *)priceAddWith:(NSString *)str;

/** 数量减一 */
+ (NSString *)numberReduceWith:(NSString *)str;

/** 数量加一 */
+ (NSString *)numberAddWith:(NSString *)str;

/** 数量减n */
+ (NSString *)numberReduceWith:(NSString *)str withSpace:(NSInteger)space;

/** 数量加n */
+ (NSString *)numberAddWith:(NSString *)str withSpace:(NSInteger)space;


/**
 金额转换(分->元)保留两位小数

 @return NSString
 */
+ (NSString *)fenToYuan:(NSString *)str;

/**
 金额转换(元->分)不保留小数
 
 @return NSString
 */
+ (NSString *)yuanToFen:(NSString *)str;

@end
