//
//  NSArray+WLArray.m
//  Yunmafu
//
//  Created by 王乐乐 on 2017/3/23.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "NSArray+WLArray.h"

@implementation NSArray (WLArray)


#pragma mark ___安全处理数组越界____
+ (void)load{
#ifdef DEBUG
    //不处理 有利于开发
#else
    /** 踩坑 需要改三个 且替换的方法需要不同 */
    [objc_getClass("__NSArray0") wl_exchangeInstanceMethod1:@selector(objectAtIndex:) method2:@selector(wl0_objectAtIndex:)];
    [objc_getClass("__NSArrayI") wl_exchangeInstanceMethod1:@selector(objectAtIndex:) method2:@selector(wlI_objectAtIndex:)];
    [objc_getClass("__NSArrayM") wl_exchangeInstanceMethod1:@selector(objectAtIndex:) method2:@selector(wlM_objectAtIndex:)];
    
    [objc_getClass("__NSArrayM") wl_exchangeInstanceMethod1:@selector(insertObject:atIndex:) method2:@selector(wl_insertObject:atIndex:)];
#endif
}
#ifdef DEBUG
#else
- (id)wl0_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self wl0_objectAtIndex:index];
    }
    return nil;
}

- (id)wlI_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self wlI_objectAtIndex:index];
    }
    return nil;
}

- (id)wlM_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self wlM_objectAtIndex:index];
    }
    return nil;
}

- (void)wl_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject != nil) {
        [self wl_insertObject:anObject atIndex:index];
    }
}

#endif

#pragma mark ___安全处理数组越界____

@end
