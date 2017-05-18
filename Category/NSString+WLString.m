//
//  NSString+WLString.m
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "NSString+WLString.h"

@implementation NSString (WLString)

/**
 *  根据文件路径计算文件或者文件夹大小 多用于计算缓存大小
 */
- (unsigned long long)wl_fileSize
{
    // 总大小
    unsigned long long size = 0;
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路径是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) return size;
    
    if (isDirectory) { // 文件夹
        // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
    } else { // 文件
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}

/**正则匹配邮箱号*/
- (BOOL)checkMailInput{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

/**正则匹配手机号*/
- (BOOL)checkTelNumber{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,183,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[356])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES)){
        return YES;
    }else{
        return NO;
    }
}

/**正则匹配用户身份证号15或18位*/
- (BOOL)checkUserIdCard{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**正则匹配银行卡号是否正确*/
- (BOOL) checkBankNumber{
    NSString *bankNum=@"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**正则匹配URL*/
- (BOOL)checkURL{
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**正则只能输入数字和字母*/
- (BOOL) checkTeshuZifuNumber{
    NSString *bankNum=@"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**截取字符串后四位*/
- (NSString *)cutOutStrWith:(NSString *)str{
    NSUInteger k = str.length;
    if (k > 4) {
        return [str substringFromIndex:k - 4];
    }else{
        return str;
    }
}

/**手机号加密处理*/
- (NSString *)phoneNumberEncryptionWith:(NSString *)str{
    NSUInteger k = str.length;
    if (k == 0) return @"";
    if (k < 7) return str;
    return [str stringByReplacingCharactersInRange:NSMakeRange(3, k-7) withString:@"****"];
}

/**身份证号加密处理*/
- (NSString *)idCardNumberEncryptionWith:(NSString *)str{
    NSUInteger k = str.length;
    if (k == 0) return @"";
    if (k < 7) return str;
    return [str stringByReplacingCharactersInRange:NSMakeRange(3, k-7) withString:@"***********"];
}

/**姓名加密处理*/
+ (NSString *)nameEncryptionWith:(NSString *)str{
    NSUInteger k = str.length;
    if (k == 0) return @"";
    return [str stringByReplacingCharactersInRange:NSMakeRange(1,1) withString:@"*"];
}

/**银行卡号加密处理*/
+ (NSString *)bankCardNumberEncryptionWith:(NSString *)str{
    NSUInteger k = str.length;
    if (k == 0) return @"";
    if (k < 8) return str;
    return [str stringByReplacingCharactersInRange:NSMakeRange(4, k-8) withString:@"********"];
}


/** 价格减一 */
+ (NSString *)priceReduceWith:(NSString *)str{
    double temp = [str doubleValue];
    temp -=0.01;
    if (temp <= 0) return @"0";
   return [NSString stringWithFormat:@"%.2f",temp];
}

/** 价格加一 */
+ (NSString *)priceAddWith:(NSString *)str{
    double temp = [str doubleValue];
    temp +=0.01;
    return [NSString stringWithFormat:@"%.2f",temp];
}

/** 数量减一 */
+ (NSString *)numberReduceWith:(NSString *)str{
    return [NSString numberReduceWith:str withSpace:1];
}

/** 数量加一 */
+ (NSString *)numberAddWith:(NSString *)str{
    return [NSString numberAddWith:str withSpace:1];
}

/** 数量减n */
+ (NSString *)numberReduceWith:(NSString *)str withSpace:(NSInteger)space{
    long long temp = [str longLongValue];
    temp -= space;
    if (temp <= 0) return @"0";
    return [NSString stringWithFormat:@"%lld",temp];
}
/** 数量加n */
+ (NSString *)numberAddWith:(NSString *)str withSpace:(NSInteger)space{
    long long temp = [str longLongValue];
    temp += space;
    return [NSString stringWithFormat:@"%lld",temp];
}

/**
 金额转换(分->元)保留两位小数
 
 @return NSString
 */
+ (NSString *)fenToYuan:(NSString *)str{
    return [NSString stringWithFormat:@"%.2f",str.doubleValue/100.0];
}

/**
 金额转换(元->分)不保留小数
 
 @return NSString
 */
+ (NSString *)yuanToFen:(NSString *)str{
    return [NSString stringWithFormat:@"%.0f",str.doubleValue*100.0];
}

@end
