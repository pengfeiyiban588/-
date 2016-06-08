//
//  XPChannel.h
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XPChannel : NSObject
/**
 *  拼接链接的ID
 */
@property (nonatomic,copy) NSString *tid;
/**
 *  频道的名字
 */
@property (nonatomic,copy) NSString *tname;
/**
 *  频道对应的url
 */
@property (nonatomic,copy) NSString *tidURLString;

+ (NSArray *)channels;

+ (instancetype)channelWithDict:(NSDictionary *)dict;
@end
