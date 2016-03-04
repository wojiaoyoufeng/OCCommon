//
//  CountryViewController.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/2.
//  Copyright © 2016年 RJ. All rights reserved.
//

#define barH 44 //导航栏的高度

#import "CountryViewController.h"
#import "CountryViewCell.h"
//#import "CountryModel.h"

@interface CountryViewController ()<UISearchBarDelegate, UISearchDisplayDelegate,UITableViewDelegate,UITableViewDataSource>
{
    BOOL isEnglish;
    BOOL isSearching;
}
/*
NSMutableData *_data;
int _state;
 */
@property (weak, nonatomic) UIView * countryNBar;//导航栏
@property (weak, nonatomic) UILabel * nTitleL;//标题
@property (weak, nonatomic) UIButton * lBackB;//返回
@property (weak, nonatomic) UISearchBar * searchBar;//搜索条
@property (weak, nonatomic) UITableView * tableView;//列表

@property (strong, nonatomic) NSArray * countryArr; //国家集
@property (strong, nonatomic) NSMutableArray * keys;//keys
@property (strong, nonatomic) NSMutableArray * countrys;//名字

@end

@implementation CountryViewController

#pragma mark -- 懒加载
- (UIView *)countryNBar
{
    if (!_countryNBar) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, barH)];
        [self.view addSubview:view];
        view.backgroundColor = [UIColor purpleColor];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(leftBackButttonClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setFont:[UIFont systemFontOfSize:15.f]];
        [view addSubview:btn];
        CGFloat h = 30;
        CGFloat y = barH - h;
        btn.frame = CGRectMake(8, y, 45, h);
        self.lBackB = btn;
        
        UILabel * label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        [label setTextColor:[UIColor whiteColor]];
        [label setText:@"国家或地区"];
        [label setFont:[UIFont systemFontOfSize:15.f]];
        [view addSubview:label];
        
        CGFloat w = 120;
        CGFloat x = (screenW - w) * 0.5;
        label.frame = CGRectMake(x, y, w, h);
        self.nTitleL = label;
        
        _countryNBar = view;
    }
    return _countryNBar;
}
#pragma mark -- 返回
- (void)leftBackButttonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, barH, screenW, screenH - barH) style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        
        _tableView = tableView;
    }
    return _tableView;
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        
        UISearchBar * Sbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, screenW, 44)];
        [self.tableView addSubview:Sbar];
        
        Sbar.placeholder = isEnglish ? @"Search" : @"搜索";
        Sbar.barTintColor = GrayColor(240);
        Sbar.delegate = self;
        _searchBar = Sbar;
    }
    return _searchBar;
}

- (NSArray *)countryArr
{
    if (!_countryArr) {
        
        //路径
        NSString * path = [[NSBundle mainBundle] pathForResource:@"AreaCode" ofType:@"json"];
        //乱码
        NSString * jsonStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        //二进制
        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        
        //数组 / 序列化
        NSArray * arr = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err]];
        
        _countryArr = arr;
    }
    
    return _countryArr;
}

- (NSMutableArray *)keys
{
    if (!_keys) {
        
        NSMutableArray * keys = [NSMutableArray arrayWithCapacity:0];
        _keys = keys;
    }
    return _keys;
}

- (NSMutableArray *)countrys
{
    if (!_countrys) {
        
        NSMutableArray *countrys = [NSMutableArray arrayWithCapacity:0];
        _countrys = countrys;
    }
    return _countrys;
}

#pragma mark -- view周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([[self getCurrentLanguage] containsString:@"zh-Hans"]) {
        isEnglish = NO;
    }
    else
    {
        isEnglish = YES;
    }
    [self countryNBar];
    self.tableView.tableHeaderView = self.searchBar;
    [self.tableView registerClass:[CountryViewCell class] forCellReuseIdentifier:NSStringFromClass([CountryViewCell class])];
    
    [self resetSearch];
}

#pragma mark -- 数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.keys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.keys count] == 0) return 0;
    NSString * key = self.keys[section];
    NSDictionary *tempKeyDict = self.countrys[section];
    NSArray * keyCountrys = tempKeyDict[key];
    
    return keyCountrys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.keys count] == 0) return 0;
    CountryViewCell * cell = [CountryViewCell countryViewCellWithTableView:tableView];
    
    NSString * key = self.keys[indexPath.section];
    NSDictionary *tempKeyDict = self.countrys[indexPath.section];
    NSArray * keyCountrys = tempKeyDict[key];
    NSDictionary *dict = keyCountrys[indexPath.row];
    
    cell.countryFlagImageV.image = [UIImage imageNamed:dict[@"flag_image_name"]];
    cell.countryNameL.text = isEnglish ? dict[@"en_name"] : dict[@"cn_name"];
    cell.countryCodeL.text = [NSString stringWithFormat:@"+%@",dict[@"area_code"]];
    
    return cell;
}

#pragma mark -- 代理
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = self.keys[section];
    if (key == UITableViewIndexSearch) return nil;
    
    return key;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (isSearching) return nil;
    
    return self.keys;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
    isSearching = NO;
    [tableView reloadData];
    return indexPath;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title
               atIndex:(NSInteger)index
{
    NSString *key = [self.keys objectAtIndex:index];
    if (key == UITableViewIndexSearch)
    {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }
    else return index;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * key = self.keys[indexPath.section];
    NSDictionary * tempKeyDict = self.countrys[indexPath.section];
    NSArray * keyCountrys = tempKeyDict[key];
    NSDictionary * dict = keyCountrys[indexPath.row];
    
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.view endEditing:YES];
#pragma mark -- 传递数据
    if ([self.delegate respondsToSelector:@selector(countryViewControllerGetCountryInfo:)]) {
        [self.delegate countryViewControllerGetCountryInfo:dict];
    }
}

#pragma mark -- 搜索代理
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.searchBar.showsCancelButton = YES;
    [self.view endEditing:YES];
    
    [self handleSearchForTerm:searchBar.text];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.searchBar.showsCancelButton = YES;
    UIView *topView = searchBar.subviews[0];
    for (UIButton * button in topView.subviews){
        if ([button isKindOfClass:[UIButton class]]) {
            NSString * cancelStr = isEnglish ? @"Cancel" : @"取消";
            [button setTitle:cancelStr forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
    isSearching = YES;
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchTerm
{
    if (searchTerm.length == 0)
    {
        [self resetSearch];
        [self.tableView reloadData];
        return;
    }
    
    [self handleSearchForTerm:searchTerm];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
//    for (UIView * view in searchBar.subviews){
//        if ([view isKindOfClass:[UIButton class]]) {
//            UIButton *cancelB = (UIButton*)view;
//            
//            NSLog(@"    %@       ",view);
//            
//            NSString * cancelStr = isEnglish ? @"Cancel" : @"取消";
//            [cancelB setTitle:cancelStr forState:UIControlStateNormal];
//            [cancelB setBackgroundColor:[UIColor redColor]];
//            [cancelB setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        }
//    }
    
    isSearching = NO;
    self.searchBar.text = @"";
    self.searchBar.showsCancelButton = NO;
    [self resetSearch];
    [self.tableView reloadData];
    
    [searchBar resignFirstResponder];
}


#pragma mark Custom Methods
#pragma mark  当前语言
- (NSString *)getCurrentLanguage
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return currentLanguage;
}

- (void)handleSearchForTerm:(NSString *)searchTerm
{
    [self.keys removeAllObjects];
    [self.keys addObject:searchTerm];
    
    NSMutableArray * tempCountrys = [NSMutableArray arrayWithCapacity:0];
    for (NSString * key in self.keys) {
        
        NSMutableDictionary * tempKeyDict = [NSMutableDictionary dictionaryWithCapacity:0];
        NSMutableArray * tempName = [NSMutableArray arrayWithCapacity:0];
        NSString *name = @"";
        for (NSDictionary * dict in self.countryArr) {
            name = isEnglish ? dict[@"en_name"] : dict[@"cn_name"];
            if ([name rangeOfString:key options:NSCaseInsensitiveSearch].location != NSNotFound) {
                [tempName addObject:dict];
            }
        }
        [tempKeyDict setObject:tempName forKey:key];
        [tempCountrys addObject:tempKeyDict];
    }
    self.countrys = tempCountrys;
    [self.tableView reloadData];
}

- (void)resetSearch
{
    /*
     "area_code": "374",
     "cn_key": "A",
     "cn_name": "亚美尼亚",
     "en_key": "A",
     "en_name": "Armenia",
     "flag_image_name": "Armenia.png",
     "formats": [leading = <null>,
     pattern = $1 $2 $3,
     formatregex = (\d{3})(\d{3})(\d{3})],
     "isocode": "AM",
     "maxlen": "20",
     "minlen": "8"
     */
    
    //arr : dict : key : [dict dict]
          //dict : key : [dict dict]
    
    NSMutableArray * tempKeyArr = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in self.countryArr) {
        NSString * key = isEnglish ? dict[@"en_key"] : dict[@"cn_key"];
        if (![tempKeyArr containsObject:key]) {
            [tempKeyArr addObject:key];
        }
    }
    
    NSMutableArray * keyArr = [NSMutableArray arrayWithCapacity:0];
    [keyArr addObject:UITableViewIndexSearch];
    [keyArr addObjectsFromArray:[tempKeyArr sortedArrayUsingSelector:@selector(compare:)]];
    self.keys = keyArr;
    
    NSMutableArray * tempCountrys = [NSMutableArray arrayWithCapacity:0];
    for (NSString * key in self.keys) {
        NSMutableDictionary * tempKeyDict = [NSMutableDictionary dictionaryWithCapacity:0];
        NSMutableArray * tempName = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary * dict in self.countryArr) {
            NSString * keyD = isEnglish ? dict[@"en_key"] : dict[@"cn_key"];
            if ([keyD isEqualToString:key]) {
                [tempName addObject:dict];
            }
        }
        [tempKeyDict setObject:tempName forKey:key];
        [tempCountrys addObject:tempKeyDict];
    }
    self.countrys = tempCountrys;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
