//
//  NSDictionary+WLDictionary.h
//  Kangyx
//
//  Created by 王乐乐 on 16/9/27.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WLDictionary)
/** 生成所需要的属性代码 */
- (void)wl_propertyCode;

- (void)wl_propertyCodeSwift;

@end
