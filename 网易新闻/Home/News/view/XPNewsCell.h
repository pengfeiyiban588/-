//
//  XPNewsCell.h
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XPNews;
@interface XPNewsCell : UITableViewCell


@property (nonatomic,strong) XPNews *news;

+ (instancetype)newsWithTableView:(UITableView *)tableView;

@end
