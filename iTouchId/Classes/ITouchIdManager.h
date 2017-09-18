//
//  ITouchIdManager.h
//  iTouchId_Example
//
//  Created by zhangrongwu on 2017/9/18.
//  Copyright © 2017年 zhangrongwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
@protocol ITouchIdManagerDelegate <NSObject>
@required
//  验证成功
- (void)TouchIdAuthorizeSuccess;
//  验证失败
- (void)TouchIdAuthorizeFailure;

@optional

//  取消了验证（点击了取消）
- (void)TouchIdAuthorizeUserCancel;

//  在TouchID对话框点击输入密码按钮
- (void)TouchIdAuthorizeUserFallBack;

//  在验证的TouchID的过程中被系统取消 例如突然来电话、按了Home键、锁屏...
- (void)TouchIdAuthorizeSystemCancel;

//  无法使用TouchID,设备没有设置密码
- (void)TouchIdAuthorizePasswordNotSet;

//  没有录入TouchID,无法使用
- (void)TouchIdAuthorizeTouchIDNotSet;

//  该设备的TouchID无效
- (void)TouchIdAuthorizeTouchIDNotAvailable;

//  多次连续使用Touch ID失败，Touch ID被锁，需要用户输入密码解锁
- (void)TouchIdAuthorizeTouchIDNotLockOut;

//  当前软件被挂起取消了授权(如突然来了电话,应用进入前台)
- (void)TouchIdAuthorizeTouchIDAppCancel;

//  当前软件被挂起取消了授权 (授权过程中,LAContext对象被释)
- (void)TouchIdAuthorizeTouchIDInvalidContext;

//  当前设备不支持指纹识别
- (void)TouchIdAuthorizeNotSupport;
@end

@interface ITouchIdManager : NSObject

@property (nonatomic, weak)id<ITouchIdManagerDelegate> delegate;

- (void)startTouchIdWithMessage:(NSString *)message FallBackTitle:(NSString *)fallBackTitle Delegate:(id<ITouchIdManagerDelegate>)delegate;

@end









