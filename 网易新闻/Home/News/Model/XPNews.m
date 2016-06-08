//
//  XPNews.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPNews.h"
#import "XPManagerTools.h"
@implementation XPNews

+ (instancetype)newsWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (void)newsWithURLString:(NSString *)URLString CompeleteBlock:(compeleteBlock)compeleteBlock{
    
    //创建单例
    [[XPManagerTools sharedXPManagerTools] objcWithURLString:URLString FinishedBlock:^(id result) {
        
        NSDictionary *dict = (NSDictionary *)result;
        
        //取出字典对应 的所有的key
        NSString *key = dict.allKeys.lastObject;
        
        //根据key取出字典数组
        
        NSArray *dictArr = dict[key];
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        [dictArr enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            XPNews *news = [XPNews newsWithDict:obj];
            
            [arrM addObject:news];
            
        }];
        if (compeleteBlock) {
            compeleteBlock(arrM.copy);
        }
        
    }];
    
}
- (NSString *)description{
    return [NSString stringWithFormat:@"%@---%@",_title,_digest];
}

@end
