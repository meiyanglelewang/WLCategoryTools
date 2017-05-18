//
//  NSDictionary+WLDictionary.m
//  Kangyx
//
//  Created by 王乐乐 on 16/9/27.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "NSDictionary+WLDictionary.h"

@implementation NSDictionary (WLDictionary)

#pragma mark ___安全处理nil插入____
+ (void)load{
#ifdef DEBUG
    //不处理 有利于开发
#else
    [objc_getClass("__NSDictionaryM") wl_exchangeInstanceMethod1:@selector(setObject:forKey:) method2:@selector(wl_setObject:forKey:)];

#endif
}
#ifdef DEBUG
#else
- (void)wl_setObject:(id)value forKey:(id)key{
    if (value!=nil) {
        [self wl_setObject:value forKey:key];
    }
}

#endif
#pragma mark ___安全处理nil插入____

// isKindOfClass:判断下是否是当前类或者子类
// @property (nonatomic ,strong) NSString  *text;
// @property (nonatomic ,assign) NSInteger  reposts_count;
// @property (nonatomic ,assign) NSArray  *pic_urls;
- (void)wl_propertyCode{
    
    // 属性跟字典的key一一对应
    NSMutableString *codes = [NSMutableString string];
    // 遍历字典中所有key取出来
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        // key:属性名
        NSString *code;
        if ([obj isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic ,strong) NSString *%@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,assign) BOOL %@;",key];
        }else if ([obj isKindOfClass:[NSNumber class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,assign) NSInteger %@;",key];
        }else if ([obj isKindOfClass:[NSArray class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,strong) NSArray *%@;",key];
        }else if ([obj isKindOfClass:[NSDictionary class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic ,strong) NSDictionary *%@;",key];
        }
        
        
        
        [codes appendFormat:@"\n%@\n",code];
        
    }];
    
    WLog(@"%@",codes);
    
}

- (void)wl_propertyCodeSwift{
    
    // 属性跟字典的key一一对应
    NSMutableString *codes = [NSMutableString string];
    // 遍历字典中所有key取出来
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        // key:属性名
        NSString *code;
        if ([obj isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"var %@ : String? /** <#type#> */",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"var %@ : Bool? /** <#type#> */",key];
        }else if ([obj isKindOfClass:[NSNumber class]]){
            code = [NSString stringWithFormat:@"var %@ : Int? /** <#type#> */",key];
        }else if ([obj isKindOfClass:[NSArray class]]){
            code = [NSString stringWithFormat:@"var %@ : []? /** <#type#> */",key];
        }else if ([obj isKindOfClass:[NSDictionary class]]){
            code = [NSString stringWithFormat:@"var %@ : [:]? /** <#type#> */",key];
        }
        
        
        
        [codes appendFormat:@"\n%@\n",code];
        
    }];
    
    WLog(@"%@",codes);
    
}

@end
