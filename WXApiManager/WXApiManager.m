//
//  WXApiManager.m
//  feifanyouwo
//
//  Created by 渠晓友 on 2019/9/27.
//  Copyright © 2019 zhuang chaoxiao. All rights reserved.
//

#import "WXApiManager.h"

@implementation WXApiManager

#pragma mark - LifeCycle
+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static WXApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WXApiManager alloc] init];
    });
    return instance;
}

#pragma mark - 微信回调

- (void)onResp:(BaseResp *)resp
{
    DLog(@"接收微信回调 , 当支付成功需要回调后台真实支付结果---- ");
    
    if ([resp isKindOfClass: PayResp.class]) {
        
        if (_delegate && [_delegate respondsToSelector:@selector(managerDidRecvPayResponse)]) {
            [_delegate managerDidRecvPayResponse];
        }
        
        // 这里可以本地处理支付状态，但是正确应该使用后台返回
//        PayResp * response = (PayResp*)resp;
//        switch (response.errCode){
//            case WXSuccess:
//            {
//                //服务器端查询支付通知或查询API返回的结果再提示成功
//                DLog(@"支付成功.. 用代理去回调后台接口");
//
//                if (_delegate && [_delegate respondsToSelector:@selector(managerDidRecvPayResponse)]) {
//                    [_delegate managerDidRecvPayResponse];
//                }
//
//            }
//            break;
//            default:
//                DLog(@"这里实际上是支付失败。。。");
//            break;
//        }
    }
}

@end
