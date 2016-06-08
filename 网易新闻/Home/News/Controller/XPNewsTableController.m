//
//  XPNewsTableController.m
//  网易新闻
//
//  Created by 鹏 on 16/6/7.
//  Copyright © 2016年 cn.heima. All rights reserved.
//

#import "XPNewsTableController.h"
#import "XPNews.h"
#import"XPNewsCell.h"
@interface XPNewsTableController ()<UITableViewDataSource>
//存储模型的数组
@property (nonatomic,strong) NSArray *array;
@end

@implementation XPNewsTableController

- (void)setTidUrlString:(NSString *)tidUrlString{
    
    _tidUrlString = tidUrlString;
    
    [XPNews newsWithURLString:tidUrlString CompeleteBlock:^(NSArray *array) {
        
//        NSLog(@"%@",array);
        //传入数据
        self.array = array;
        //刷新表格
        [self.tableView reloadData];
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.dataSource = self;
    
    
}
#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XPNews *news = self.array[indexPath.row];
    static NSString *ID = nil;
    
    if (news.imgType) {
        
        ID = @"Bigcell";
    }else if (news.imgextra.count == 2){
        ID = @"threeCell";
        
    }else{
        ID = @"baseCell";
    }
    
  
   

      XPNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
      cell.news = news;
   
    
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
