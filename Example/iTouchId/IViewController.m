//
//  IViewController.m
//  iTouchId
//
//  Created by zhangrongwu on 09/18/2017.
//  Copyright (c) 2017 zhangrongwu. All rights reserved.
//

#import "IViewController.h"
#import "ITouchIdManager.h"

@interface IViewController ()<ITouchIdManagerDelegate>

@end

@implementation IViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ITouchIdManager *touchId = [[ITouchIdManager alloc] init];
    [touchId startTouchIdWithMessage:@"通过Home键验证已有手机指纹" FallBackTitle:@"" Delegate:self];
}

//  验证成功
- (void)TouchIdAuthorizeSuccess {
    NSLog(@"成功 ：%s", __FUNCTION__);
}

//  验证失败
- (void)TouchIdAuthorizeFailure {
    NSLog(@"失败 ：%s", __FUNCTION__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  取消了验证（点击了取消）
- (void)TouchIdAuthorizeUserCancel {
    NSLog(@"%s", __FUNCTION__);
}

//  在TouchID对话框点击输入密码按钮
- (void)TouchIdAuthorizeUserFallBack{
    NSLog(@"%s", __FUNCTION__);
}
//  在验证的TouchID的过程中被系统取消 例如突然来电话、按了Home键、锁屏...
- (void)TouchIdAuthorizeSystemCancel{
    NSLog(@"%s", __FUNCTION__);
}

//  无法使用TouchID,设备没有设置密码
- (void)TouchIdAuthorizePasswordNotSet{
    NSLog(@"%s", __FUNCTION__);
}

//  没有录入TouchID,无法使用
- (void)TouchIdAuthorizeTouchIDNotSet{
    NSLog(@"%s", __FUNCTION__);
}

//  该设备的TouchID无效
- (void)TouchIdAuthorizeTouchIDNotAvailable{
    NSLog(@"%s", __FUNCTION__);
}

//  多次连续使用Touch ID失败，Touch ID被锁，需要用户输入密码解锁
- (void)TouchIdAuthorizeTouchIDNotLockOut{
    NSLog(@"%s", __FUNCTION__);
}

//  当前软件被挂起取消了授权(如突然来了电话,应用进入前台)
- (void)TouchIdAuthorizeTouchIDAppCancel{
    NSLog(@"%s", __FUNCTION__);
}

//  当前软件被挂起取消了授权 (授权过程中,LAContext对象被释)
- (void)TouchIdAuthorizeTouchIDInvalidContext{
    NSLog(@"%s", __FUNCTION__);
}

//  当前设备不支持指纹识别
- (void)TouchIdAuthorizeNotSupport{
    NSLog(@"%s", __FUNCTION__);
}

@end
