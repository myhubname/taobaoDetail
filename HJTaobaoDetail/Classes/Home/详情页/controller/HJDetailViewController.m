//
//  HJDetailViewController.m
//  Passersbyjun
//
//  Created by 嘉瑞科技有限公司 on 2018/3/20.
//  Copyright © 2018年 嘉瑞科技有限公司. All rights reserved.
//

#import "HJDetailViewController.h"
#import "HJDetailTopView.h"
@interface HJDetailViewController ()<UITableViewDelegate,UITableViewDataSource,HJdetailTopViewDelegate>

/*列表*/
@property(nonatomic,strong) HJBaseTableView *tableView;
//透明度
@property (nonatomic, assign) CGFloat alphaMemory;

@property(nonatomic,copy) NSArray *sectionArr;

/*顶部栏*/
@property(nonatomic,strong) HJDetailTopView *topView;
@end

@implementation HJDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    adjustsScrollViewInsets_NO(self.tableView, self);

    self.sectionArr = @[@"宝贝",@"评论",@"详情",@"推荐"];

    [self wr_setNavBarBackgroundAlpha:_alphaMemory];
    
    [self wr_setNavBarBarTintColor:[UIColor whiteColor]];

    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.topView];
    
}

-(HJDetailTopView *)topView{
    
    if (!_topView) {
        
        _topView = [[HJDetailTopView alloc] initWithFrame:CGRectMake(0, TopHeight, SCREEN_WIDTH, 50)];
        _topView.topArr = self.sectionArr;
        _topView.selectedStr = @"宝贝";
        _topView.alphScroller = self.alphaMemory;
        _topView.delegate = self;
    }
    return _topView;
}


-(HJBaseTableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[HJBaseTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 250)];
        headerView.backgroundColor = [UIColor redColor];
        _tableView.tableHeaderView = headerView;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const identifer  = @"identifer";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return SCREENH_HEIGHT - 200;
    }else
    {
      return SCREENH_HEIGHT;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 0.01;
    }else
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return nil;
    }else{
        UIView *headerView = [[UIView alloc] init];
        
        headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UILabel *label = [[UILabel alloc] init];
        label.text = self.sectionArr[section];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        [headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.centerY.offset(0);
        }];        
        return headerView;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

 CGFloat offsetY = scrollView.contentOffset.y;
 if (offsetY>=0) {
     if (offsetY<=200) {
        _alphaMemory = offsetY/(250) >= 1 ? 1 : offsetY/250;
        [self wr_setNavBarBackgroundAlpha:self.alphaMemory];
        self.topView.alphScroller = self.alphaMemory;
     }else if (offsetY>250){
     
        _alphaMemory = 1;
        self.topView.hidden = NO;
        [self wr_setNavBarBackgroundAlpha:_alphaMemory];
         self.topView.alphScroller = self.alphaMemory;
     }
 }
    
    [self.sectionArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if (offsetY >= [self.tableView rectForSection:idx].origin.y-TopHeight-60) {
            
            self.topView.selectedStr = self.sectionArr[idx];
        }
        
    }];

}

-(void)gotoScroollerAndTitle:(NSString *)title
{
    [self.sectionArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([title isEqualToString:obj]) {
            
            if (idx == 0) {
                
                
                [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
                    
            }else
            {
                [self.tableView setContentOffset:CGPointMake(0, [self.tableView rectForSection:idx].origin.y-TopHeight-50) animated:YES];
            }
            
        }
        
    }];
}
@end
