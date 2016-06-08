//
//  XPChannel.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPChannel.h"

@implementation XPChannel
//因为每个频道的链接只有tid不一样,因此重写tid的set的发法,在此方法里面对tidURLString进行拼接
- (void)setTid:(NSString *)tid{
    
    _tid = tid;
    
    if([_tid isEqualToString:@"T1348647853363"])//头条链接不一样headline,其他是list可以拼接一块
    {
        _tidURLString = @"nc/article/headline/T1348647853363/0-20.html";
        
    }else {
        
        _tidURLString = [NSString stringWithFormat:@"nc/article/list/%@/0-20.html",_tid];
        
    }
    
    
}

+ (instancetype)channelWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
}

//重写setValuesForKeysWithDictionary的方法什么都不做
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"%@-----%@",_tid,_tname];
}

+ (NSArray *)channels{
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    //将JSON转化为二进制
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //将二进制转化为字典
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    //取出字典里面的数组字典
    NSArray *dictArr = dict[@"tList"];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    
    [dictArr enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //字典转模型
        XPChannel *channel = [XPChannel channelWithDict:obj];
        
        [arrM addObject:channel];
        
    }];
    
    //根据tid按从小到大排列(数组排列)
    [arrM sortUsingComparator:^NSComparisonResult(XPChannel* obj1, XPChannel* obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
   
    return arrM;
}


@end
