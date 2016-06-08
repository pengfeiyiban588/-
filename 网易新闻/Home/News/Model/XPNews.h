//
//  XPNews.h
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^compeleteBlock)(NSArray *array);
@interface XPNews : NSObject
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *  摘要
 */
@property (nonatomic,copy) NSString *digest;
/**
 *  多张配图
 */
@property (nonatomic,strong) NSArray *imgextra;
/**
 *  跟帖数
 */
@property (nonatomic,assign) NSInteger replyCount;
/**
 *  图片
 */
@property (nonatomic,copy) NSString *imgsrc;

/**
 *  大图标记
 */
@property (nonatomic,assign) BOOL imgType;
//根据传入的tidURLString,去网络上加载对应频道的数据,然后通过block回调返回给我们的控制器
+ (void)newsWithURLString:(NSString *)URLString CompeleteBlock:(compeleteBlock)compeleteBlock;
@end
