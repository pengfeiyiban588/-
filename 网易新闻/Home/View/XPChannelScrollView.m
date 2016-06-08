//
//  XPChannelScrollView.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPChannelScrollView.h"
#import "XPChannelLable.h"
#import "XPChannel.h"
@interface XPChannelScrollView ()

@property (nonatomic,strong) NSArray *channels;



//@property (nonatomic,strong) XPChannelLable *lbl;
@end


@implementation XPChannelScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat lblH = self.bounds.size.height;
        CGFloat lblW = 80;
        CGFloat lblY = 0;
        
        self.channels = [XPChannel channels];
        
        for (NSInteger i = 0; i < self.channels.count; i++) {
            
            XPChannelLable *lbl = [[XPChannelLable alloc]init];
            
            lbl.frame = CGRectMake(lblW*i, lblY, lblW, lblH);
            
            [self addSubview:lbl];
            
            XPChannel *channel = self.channels[i];
            
            lbl.text = channel.tname;
            
        }
        
        //设置XPChannelScrollView的contentSize
        self.contentSize = CGSizeMake(lblW*self.channels.count, 44);
        //取消垂直和水平方向的滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        
    }
    return self;
}



@end
