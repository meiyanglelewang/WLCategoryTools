//
//  UISearchBar+YMFCBSearchBar.m
//  Yunmafu
//
//  Created by 炳神 on 2017/5/17.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "UISearchBar+YMFCBSearchBar.h"

@implementation UISearchBar (YMFCBSearchBar)
- (void)searchBarPlaceholder:(NSString *)placeholder searchTextFiledBacColor:(UIColor *)color{
    self.placeholder = placeholder;
    UITextField *textFiled = [self valueForKey:@"_searchField"];
    textFiled.backgroundColor = color;
    
    self.backgroundImage = [UIImage new];
}
@end
