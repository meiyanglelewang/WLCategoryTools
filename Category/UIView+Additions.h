//
//  PayTool.m
//  Category
//
//  Created by 王乐乐 on 16/7/7.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

#define HUDViewTagInSuperView 4026
#define alertViewTagInSuperView 4027
typedef void(^AlertViewSelectBlock)(BOOL isOK);

@interface UIView (Additions)

+(id)loadNibView:(NSString*)theNibName;
//
//- (void)async:(void(^)(void))block;
//- (void)async_main:(void(^)(void))block;
//
//-(BOOL)isLastIOS7;
//-(BOOL)isLastIOS6;
//-(float)getIOSVersion;

-(UIViewAutoresizing)getViewAllResizingMask;

// --------- hud ---------

-(void)showHUDLoading;
-(void)showHUDLoadingTips:(NSString*)theTips;
-(void)showHUDLoadingTips:(NSString*)theTips details:(NSString*)theDetail;
-(MBProgressHUD *)showHUDProgressTips:(NSString *)theTips;

-(void)hideHUDLoading:(NSTimeInterval)delayTime;

-(void)showHUDSuccessTips:(NSString*)theTips hideDelay:(NSTimeInterval)delayTime;
-(void)showHUDFailTips:(NSString*)theTips hideDelay:(NSTimeInterval)delayTime;
-(void)showHUDWarnTips:(NSString*)theTips hideDelay:(NSTimeInterval)delayTime;
-(void)showHUDCustomView:(UIView*)theCustomView withTips:(NSString*)theTips hideDelay:(NSTimeInterval)delayTime;
-(void)showHUDTextTips:(NSString*)theTips detail:(NSString*)theDetail hideDelay:(NSTimeInterval)delayTime;

-(void)showHUDExcuteBlock:(void(^)(MBProgressHUD *hudView))exBlock complete:(void(^)(void))theBlock;
-(void)showHUDProgressBlock:(void(^)(MBProgressHUD *hudView))exBlock complete:(void(^)(void))theBlock;

// -------------------

-(void)showAlertView:(NSString*)title withContent:(NSString*)content;
-(void)showAlertViewSelect:(NSString*)title content:(NSString*)content choseBlock:(AlertViewSelectBlock)theBlock;

-(void)showTextView:(NSString*)theContent;
-(void)hideTextView:(UIControl*)theControl;

@end
