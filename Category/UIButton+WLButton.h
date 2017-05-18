//
//  UIButton+WLButton.h
//  Tuoke
//
//  Created by 王乐乐 on 2016/12/9.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BtnCostom) {
    BtnCostomTop = 1,/** 图片在上 */
    BtnCostomLeft = 2,/** 图片在左 */
    BtnCostomRight = 3,/** 图片在右 */
    BtnCostomBottom = 4 /** 图片在下 */
};

@interface UIButton (WLButton)
/** 图片位置 上左下右 默认在上 */
@property (nonatomic, assign) BtnCostom btnCostomType;

//把图片和文字边距归0
-(void)wSetButtonEdgeZero;

#pragma mark - SetImageAndTiele

//设置图片在文字上面
-(void)wSetImageTopWithSpace:(CGFloat)space;

//设置图片在文字左边
-(void)wSetImageLeftWithSpace:(CGFloat)space;

//设置图片在文字底部
-(void)wSetImageBottomWithSpace:(CGFloat)space;

//设置图片在文字右边
-(void)wSetImageRightWithSpace:(CGFloat)space;


/**
 *  图片在最上面
 *  @param fixSpacing 间距
 */
-(void)wSideImageTopWithFix:(CGFloat)fixSpacing;
/**
 *  图片在最左边
 *  @param fixSpacing 间距
 */
-(void)wSideImageLeftWithFix:(CGFloat)fixSpacing;
/**
 *  图片在最下面
 *  @param fixSpacing 间距
 */
-(void)wSideImageButtomWithFix:(CGFloat)fixSpacing;
/**
 *  图片在最右边
 *  @param fixSpacing 间距
 */
-(void)wSideImageRightWithFix:(CGFloat)fixSpacing;

/**
 *  标题在最上面
 *  @param fixSpacing 间距
 */
-(void)wSideTitleTopWithFix:(CGFloat)fixSpacing;
/**
 *  标题在最左边
 *  @param fixSpacing 间距
 */
-(void)wSideTitleLeftWithFix:(CGFloat)fixSpacing;
/**
 *  标题在最下面
 *  @param fixSpacing 间距
 */
-(void)wSideTitleButtomWithFix:(CGFloat)fixSpacing;
/**
 *  标题在最右边
 *  @param fixSpacing 间距
 */
-(void)wSideTitleRightWithFix:(CGFloat)fixSpacing;




@end
