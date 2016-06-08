//
//  XPManagerTools.h
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "AFHTTPSessionManager.h"
typedef void (^finishedBlock)(id result);
@interface XPManagerTools : AFHTTPSessionManager

//单列
+ (instancetype)sharedXPManagerTools;
//供所有模型调用的方法,模型传进来的URL和回调,当从网络上获取结果之后,在传给模型
- (void)objcWithURLString:(NSString *)URLString FinishedBlock:(finishedBlock)finishedBlock;
@end
