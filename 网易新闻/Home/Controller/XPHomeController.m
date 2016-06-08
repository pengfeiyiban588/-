//
//  XPHomeController.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPHomeController.h"
#import "XPChannel.h"
#import "XPChannelScrollView.h"
#import "XPCollectionCell.h"
@interface XPHomeController ()<UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;


@property (nonatomic,strong) NSArray *channels;
@end

@implementation XPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"网易新闻";
    [self setChannel];
    
    [self setCollectionView];
    
    
}

#pragma mark - 设置UICollectionView

static NSString *ID = @"UICollectionViewCell";
- (void)setCollectionView{
    
    self.channels = [XPChannel channels];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 108, self.view.bounds.size.width, self.view.bounds.size.height-108) collectionViewLayout:flow];
    
    self.collectionView.dataSource = self;
    
  self.collectionView.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    [self.collectionView registerClass:[XPCollectionCell class] forCellWithReuseIdentifier:ID];
    
    flow.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-108);
    
    flow.minimumLineSpacing = 0;
    
    flow.minimumInteritemSpacing = 0;
    
    //设置水平方向滚动
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal
    ;
    
    //设置分页效果
    self.collectionView.pagingEnabled = YES;
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - 设置频道栏
- (void)setChannel{
    
    XPChannelScrollView *channelScrollView = [[XPChannelScrollView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    channelScrollView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:channelScrollView];
    
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.channels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XPCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    XPChannel *channel = self.channels[indexPath.item];
    
    cell.channel = channel;
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
