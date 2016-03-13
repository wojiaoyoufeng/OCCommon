//
//  WaterfallFlowViewController.m
//  OCCommon
//
//  Created by 游峰 on 16/3/5.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

#import "WaterfallFlowLayout.h"

#import "WaterfallFlowViewController.h"
#import "WaterfallFlowCell.h"
#import "Cloth.h"


@interface WaterfallFlowViewController ()<UICollectionViewDataSource,WaterfallFlowLayoutDelegate>
@property (strong, nonatomic) NSMutableArray * clothes;
@property (weak, nonatomic) UICollectionView * collectionView;

@end

@implementation WaterfallFlowViewController

#pragma mark -- lazy
- (NSMutableArray *)clothes
{
    if (!_clothes) {
        
        NSMutableArray * arrM = [NSMutableArray arrayWithCapacity:0];
        _clothes = arrM;
    }
    return _clothes;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        WaterfallFlowLayout *layout = [[WaterfallFlowLayout alloc] init];
        layout.delegate = self;

        UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [self.view addSubview:collectionV];
        
        collectionV.backgroundColor = [UIColor whiteColor];
        collectionV.dataSource = self;
        
        [collectionV registerClass:[WaterfallFlowCell class] forCellWithReuseIdentifier:NSStringFromClass([WaterfallFlowCell class])];
        
        _collectionView = collectionV;
    }
    
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self collectionView];
     
    [self setupRefresh];
}

#pragma mark -- Refresh
- (void)setupRefresh
{
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewModels)];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreModels)];
    self.collectionView.mj_footer.hidden = YES;
}

- (void)loadNewModels
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"cloths.plist" ofType:nil];
        NSArray * arr = [NSArray arrayWithContentsOfFile:path];
        
        [self.clothes removeAllObjects];
        [self.clothes addObjectsFromArray:arr];
        
        [self.collectionView.mj_header endRefreshing];
        
        // 刷新数据
        [self.collectionView reloadData];
    });
}

- (void)loadMoreModels
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"cloths.plist" ofType:nil];
        NSArray * arr = [NSArray arrayWithContentsOfFile:path];
        
        [self.clothes addObjectsFromArray:arr];
        
        [self.collectionView.mj_footer endRefreshing];
    });
}


#pragma mark -- dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collectionView.mj_footer.hidden = (self.clothes.count == 0);
    return self.clothes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    WaterfallFlowCell * cell = [WaterfallFlowCell waterfallFlowCellCollectionView:collectionView cellForItemAtIndexPath:indexPath];

    NSDictionary * dict = [self.clothes objectAtIndex:indexPath.item];
    [cell.imageView sd_setImageWithURL:dict[@"img"]];
    [cell.botLabel setText:dict[@"price"]];
    
//    NSLog(@"   %@    ", NSStringFromCGRect(cell.frame));
    
    return cell;
}
     
#pragma mark -- WaterfallFlowLayoutDelegate代理
- (CGFloat)waterfallFlowLayout:(WaterfallFlowLayout *)waterfallFlowLayout heightForItemAtIndex:(NSInteger)index itemWidth:(CGFloat)itemWidth
{
    
    NSDictionary * dict = [self.clothes objectAtIndex:index];
    
    return (CGFloat)itemWidth * [dict[@"h"] intValue] / [dict[@"w"] intValue];
}

//- (CGFloat)columnCountInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
//{
////    if (self.clothes.count <= 50) return 2;
//    return 3;
//}
//
//- (CGFloat)columnMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
//{
//    return 10;
//}
//
//- (CGFloat)rowMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
//{
//    return 10;
//}
//
//- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
//{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
