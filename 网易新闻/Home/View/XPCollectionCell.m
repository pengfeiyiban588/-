//
//  XPCollectionCell.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPCollectionCell.h"
#import "XPNewsTableController.h"
#import "XPChannel.h"
@interface XPCollectionCell ()


@property (nonatomic,strong) XPNewsTableController *newsVc;

@end

@implementation XPCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        
        self.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        self.newsVc = [[XPNewsTableController alloc]init];
        
        [self.contentView addSubview:self.newsVc.tableView];
        
        self.newsVc.tableView.frame = self.contentView.bounds;
    
        
        
    }
    return self;
}

#pragma mark - 传值相关(传给XPNewsTableController控制器url)
- (void)setChannel:(XPChannel *)channel{
    
    _channel = channel;
    
    self.newsVc.tidUrlString = channel.tidURLString;
    
}
@end
