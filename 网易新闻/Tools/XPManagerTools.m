//
//  XPManagerTools.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPManagerTools.h"
#import "AFNetworking.h"
@implementation XPManagerTools

#if DEBUG
static NSString *baseURL = @"http://c.m.163.com/";
#else
static NSString *baseURL = @"http://xxxxxxxom/";
#endif


+ (instancetype)sharedXPManagerTools{
    
    static dispatch_once_t onceToken;
    static XPManagerTools *_instance = nil;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:baseURL]];
        //改默认响应类型
        _instance.responseSerializer.acceptableContentTypes = [_instance.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        
    });
    
    
    return _instance;
    
}
- (void)objcWithURLString:(NSString *)URLString FinishedBlock:(finishedBlock)finishedBlock{
    
   
    //AFN去发送网络请求
    [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (finishedBlock) {
            finishedBlock(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",[error localizedDescription]);
    }];
    
    
}
@end
