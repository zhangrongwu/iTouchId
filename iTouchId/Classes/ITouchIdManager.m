//
//  ITouchIdManager.m
//  iTouchId_Example
//
//  Created by zhangrongwu on 2017/9/18.
//  Copyright © 2017年 zhangrongwu. All rights reserved.
//

#import "ITouchIdManager.h"

@implementation ITouchIdManager
- (void)startTouchIdWithMessage:(NSString *)message FallBackTitle:(NSString *)fallBackTitle Delegate:(id<ITouchIdManagerDelegate>)delegate
{
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = fallBackTitle;
    
    NSError *error = nil;
    self.delegate = delegate;
    //判断代理人是否为空
    if (self.delegate != nil) {
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            //使用context对象对识别的情况进行评估
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:message reply:^(BOOL success, NSError * _Nullable error) {
                //识别成功:
                if (success) {
                    if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeSuccess)]) {
                        //必须回到主线程执行,否则在更新UI时会出错！以下相同
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            [self.delegate TouchIdAuthorizeSuccess];
                        }];
                    }
                }
                //识别失败（对应代理方法的每种情况,不实现对应方法就没有反应）
                else if (error)
                {
                    switch (error.code) {
                        case LAErrorAuthenticationFailed:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeFailure)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeFailure];
                                }];
                            }
                            break;
                        }
                        case LAErrorUserCancel:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeUserCancel)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeUserCancel];
                                }];
                            }
                            break;
                        }
                        case LAErrorUserFallback:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeUserFallBack)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeUserFallBack];
                                }];
                            }
                            break;
                        }
                        case LAErrorSystemCancel:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeSystemCancel)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeSystemCancel];
                                }];
                            }
                            break;
                        }
                        case LAErrorTouchIDNotEnrolled:
                        {
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeTouchIDNotSet)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeTouchIDNotSet];
                                }];
                            }
                            break;
                        }
                        case LAErrorPasscodeNotSet:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizePasswordNotSet)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizePasswordNotSet];
                                }];
                            }
                            break;
                        }
                        case LAErrorTouchIDNotAvailable:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeTouchIDNotAvailable)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeTouchIDNotAvailable];
                                }];
                            }
                            break;
                        }
                        case LAErrorTouchIDLockout:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeTouchIDNotLockOut)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeTouchIDNotLockOut];
                                }];
                            }
                            break;
                        }
                        case LAErrorAppCancel:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeTouchIDAppCancel)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeTouchIDAppCancel];
                                }];
                            }
                            break;
                        }
                        case LAErrorInvalidContext:{
                            if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeTouchIDInvalidContext)]) {
                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                    [self.delegate TouchIdAuthorizeTouchIDInvalidContext];
                                }];
                            }
                            break;
                        }
                        default:
                            break;
                    }
                }
            }];
        }
    }
    //设备不支持指纹识别
    else
    {
        if ([self.delegate respondsToSelector:@selector(TouchIdAuthorizeNotSupport)]) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.delegate TouchIdAuthorizeNotSupport];
            }];
        }
    }
}
@end
