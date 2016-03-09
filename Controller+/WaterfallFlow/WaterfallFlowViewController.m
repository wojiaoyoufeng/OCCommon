//
//  WaterfallFlowViewController.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

#import "WaterfallFlowLayout.h"

#import "WaterfallFlowViewController.h"
#import "WaterfallFlowCell.h"
#import "Cloth.h"


@interface WaterfallFlowViewController ()<UICollectionViewDataSource,WaterfallFlowLayoutDelegate,UICollectionViewDelegate>
/** 所有的商品数据 */
@property (strong, nonatomic) NSMutableArray * clothes;
@property (weak, nonatomic) UICollectionView * collectionView;

@end

static const NSString * waterfallFlowCellId = @"WaterfallFlowCell";
@implementation WaterfallFlowViewController

#pragma mark -- lazy
- (NSMutableArray *)clothes
{
    if (!_clothes) {
        
        NSMutableArray * arrM = [NSMutableArray arrayWithCapacity:0];
        NSString * path = [[NSBundle mainBundle] pathForResource:@"cloths" ofType:@"plist"];
        NSArray * arr = [NSArray arrayWithContentsOfFile:path];
        [arrM addObjectsFromArray:arr];
        _clothes = arrM;
    }
    return _clothes;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        WaterfallFlowLayout *layout = [[WaterfallFlowLayout alloc] init];
        layout.delegate = self;
//        layout.rowMargin = 
        
        UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [self.view addSubview:collectionV];
        collectionV.backgroundColor = [UIColor whiteColor];
        collectionV.dataSource = self;
        collectionV.delegate = self;
        
        [collectionV registerClass:[WaterfallFlowCell class] forCellWithReuseIdentifier:waterfallFlowCellId];
        
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
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewModels)];
    [self.collectionView.header beginRefreshing];
    
    self.collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreModels)];
    self.collectionView.footer.hidden = YES;
}

- (void)loadNewModels
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"cloths.plist" ofType:nil];
        NSArray * arr = [NSArray arrayWithContentsOfFile:path];
        
        [self.clothes removeAllObjects];
        [self.clothes addObjectsFromArray:arr];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.header endRefreshing];
    });
}

- (void)loadMoreModels
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"cloths.plist" ofType:nil];
        NSArray * arr = [NSArray arrayWithContentsOfFile:path];
        
        [self.clothes addObjectsFromArray:arr];
        
        // 刷新数据
        [self.collectionView reloadData];
        [self.collectionView.footer endRefreshing];
    });
}


#pragma mark -- dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collectionView.footer.hidden = (self.clothes.count == 0);
    return self.clothes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    WaterfallFlowCell * cell = [WaterfallFlowCell waterfallFlowCellCollectionView:collectionView cellForItemAtIndexPath:indexPath];

//    NSDictionary * dict = [self.clothes objectAtIndex:indexPath.row];
//    [cell.imageView sd_setImageWithURL:dict[@"img"]];
    return cell;
}



//- (void)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(nonnull NSString *)kind atIndexPath:(nonnull NSIndexPath *)indexPath
//{
//    NSString *reuseIdentifier;
//    if ([kind isEqualToString: UICollectionElementKindSectionFooter ])
//    {
//        reuseIdentifier = kfooterIdentifier;
//    }
//    else
//    {
//        reuseIdentifier = kheaderIdentifier;
//    }
//    
//    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
//    
//    UILabel *label = (UILabel *)[view viewWithTag:1];
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
//    {
//        label.text = [NSString stringWithFormat:@"这是header:%d",indexPath.section];
//    }
//    else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
//    {
//        view.backgroundColor = [UIColor lightGrayColor];
//        label.text = [NSString stringWithFormat:@"这是footer:%d",indexPath.section];
//    }
//    
//    return view;
//}
     
#pragma mark -- WaterfallFlowLayoutDelegate代理
- (CGFloat)waterfallFlowLayout:(WaterfallFlowLayout *)waterfallFlowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    NSDictionary * dict = [self.clothes objectAtIndex:index];
    CGFloat scale =  itemWidth / (CGFloat)[dict[@"w"] intValue];
    
    return (CGFloat)[dict[@"h"] intValue] * scale;
}

- (CGFloat)columnCountInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
{
//    if (self.clothes.count <= 50) return 2;
    return 3;
}

- (CGFloat)columnMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
{
    return 10;
}

- (CGFloat)rowMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
{
    return 10;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
