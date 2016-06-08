//
//  XPNewsCell.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPNewsCell.h"
#import "XPNews.h"
#import "Masonry.h"
@interface XPNewsCell ()

@property (nonatomic,copy) NSString *ID;
//标题
@property (nonatomic,strong) UILabel *titleLbl;
//图片
@property (nonatomic,strong) UIImageView *iconView;

//显示跟帖数
@property (nonatomic,strong) UILabel *replyCountLbl;
//摘要
@property (nonatomic,strong) UILabel *digestLbl;
//图片数组

@property (nonatomic,strong) NSArray <UIImageView*> *pic;

@end

@implementation XPNewsCell

+ (instancetype)newsWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"ordinaryCell";//普通cell
    
    
    
    XPNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[XPNewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //标题
        self.titleLbl = [[UILabel alloc]init];
        
        self.titleLbl.font = [UIFont systemFontOfSize:15.0];
        
        [self.contentView addSubview:self.titleLbl];
        
        //摘要
        self.digestLbl = [[UILabel alloc]init];
        
        self.digestLbl.font = [UIFont systemFontOfSize:14.0];
        
        [self.contentView addSubview:self.digestLbl];
        
        //跟帖
        self.replyCountLbl = [[UILabel alloc]init];
        
        self.replyCountLbl.font = [UIFont systemFontOfSize:13.0];
        
        self.replyCountLbl.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.replyCountLbl];
        
        //图片
        self.iconView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:self.iconView];
    }
    return self;
}


- (void)setNews:(XPNews *)news{
    
    _news = news;
    
    self.titleLbl.text = news.title;
    self.digestLbl.text = news.digest;
    self.replyCountLbl.text = [NSString stringWithFormat:@"%zd",news.replyCount];
    
    
    
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.equalTo(self.contentView).offset(8);
        
        
    }];
    
}



@end
