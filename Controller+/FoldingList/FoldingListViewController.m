//
//  FoldingListViewController.m
//  OCCommon
//
//  Created by 游峰 on 16/3/16.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "FoldingListViewController.h"

@interface FoldingListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray * arrM;
@property (weak, nonatomic) UITableView * tableView;
@property (assign, nonatomic) BOOL isShow;

@end

@implementation FoldingListViewController
#pragma mark -- lazy
- (NSMutableArray *)arrM
{
    if (!_arrM) {
        
        NSMutableArray * arrayM = [NSMutableArray arrayWithCapacity:0];
        for (int i='A'; i<='Z'; i++)
        {// 添加数据
            NSMutableDictionary * dictM = [NSMutableDictionary dictionary];
            NSString * name  = [NSString stringWithFormat:@"%c",i];
            [dictM setObject:name forKey:@"name"];
            
            NSMutableArray * rows = [NSMutableArray array];
            for (int j = 0; j < 5; j++)
            {
                NSString * neiR = [NSString stringWithFormat:@"%@--%d", name, j];
                [rows addObject:neiR];
            }
            
            [dictM setObject:rows forKey:@"rows"];
            [arrayM addObject:dictM];
        }
            _arrM = arrayM;
    }
    return _arrM;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        UITableView * tableV = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        [self.view addSubview:tableV];
        tableV.delegate = self;
        tableV.dataSource = self;
        tableV.sectionFooterHeight = 0;
            
        _tableView = tableV;
    }
    return _tableView;
}

#pragma mark -- view周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tableView];
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrM.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableDictionary * dict = [self.arrM objectAtIndex:section];
    if ([dict[@"isShow"]  isEqual: @"YES"])
    {
        NSArray * arr = dict[@"rows"];
        return arr.count;
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    NSMutableDictionary * dict = [self.arrM objectAtIndex:indexPath.section];
    NSArray * rows = dict[@"rows"];
    NSString * rowTitle = [rows objectAtIndex:indexPath.row];
    
    cell.textLabel.text = rowTitle;
    
    return cell;
}

#pragma mark -- UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSMutableDictionary * dict = [self.arrM objectAtIndex:section];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 320, 30);
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:dict[@"name"] forState:UIControlStateNormal];
    if (section % 2)
    {
         [btn setBackgroundColor:[UIColor greenColor]];
    }
    else
    {
        [btn setBackgroundColor:[UIColor purpleColor]];
    }
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, 0, 330);
    [btn setTitleEdgeInsets:edgeInsets];
    
    btn.tag = section;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void) btnClick:(UIButton *)btn
{
    NSMutableDictionary * dict = [self.arrM objectAtIndex:btn.tag];
    
    if ([dict[@"isShow"]  isEqual: @"YES"])
    {
        [dict setObject:@"NO" forKey:@"isShow"];
        self.arrM[btn.tag] = dict;
    }
    else
    {
        [dict setObject:@"YES" forKey:@"isShow"];
        self.arrM[btn.tag] = dict;
    }
    
    // 刷新点击的组标题，动画使用卡片
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationNone];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
