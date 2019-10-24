//
//  WXApiManager.h
//  feifanyouwo
//
//  Created by 渠晓友 on 2019/9/27.
//  Copyright © 2019 zhuang chaoxiao. All rights reserved.
//


//  目前仅用于微信支付请求的回调响应 -- 后期可根据需求拓展
//  任何使用微信支付的地方，VC 遵守本协议，实现支付回调方法。。在回调中请求后台的支付状态即可



#import <Foundation/Foundation.h>
#import "WXApi.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WXApiManagerDelegate <NSObject>

@optional

/// 接收到微信支付结束后回调
- (void)managerDidRecvPayResponse;

@end

@interface WXApiManager : NSObject<WXApiDelegate>

@property (nonatomic, assign) id<WXApiManagerDelegate> delegate;

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
