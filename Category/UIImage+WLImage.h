//
//  UIImage+WLImage.h
//  Kangyx
//
//  Created by 王乐乐 on 16/9/19.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WLImage)

/** 截屏根据view */
+ (UIImage *)wl_captureWithView:(UIView *)view;

/**根据颜色生成图片*/
+ (UIImage *)imageWithColor:(UIColor *)color;

/**根据颜色和大小生成图片*/
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**一个点的颜色*/
- (UIColor *)colorAtPoint:(CGPoint )point;

//more accurate method ,colorAtPixel 1x1 pixel
/**一个像素的颜色*/
- (UIColor *)colorAtPixel:(CGPoint)point;

/**返回该图片是否有透明度通道*/
- (BOOL)hasAlphaChannel;

/** 图片裁剪 */
- (UIImage *)cb_scaleToSize:(CGSize)size;

@end
