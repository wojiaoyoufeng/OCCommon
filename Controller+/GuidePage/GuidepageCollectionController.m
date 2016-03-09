//
//  GuidepageCollectionController.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "GuidepageCollectionController.h"
#import "GuidepageCollectionCell.h"

@interface GuidepageCollectionController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

//@property (weak, nonatomic) UICollectionViewFlowLayout * collectionViewFlowLayout;
@property (weak, nonatomic) UICollectionView * collectionView;
@property (weak, nonatomic) UIImageView * guideImageV;
@property (weak, nonatomic) UIImageView * smallTextImageV;
@property (weak, nonatomic) UIImageView * largeTextImageV;
@property (assign, nonatomic) CGFloat offsetX;

@end

@implementation GuidepageCollectionController

#pragma mark -- 懒加载
//- (UICollectionViewFlowLayout *)collectionViewFlowLayout
//{
//    if (!_collectionViewFlowLayout) {
//        
//        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
//        flowLayout.minimumLineSpacing = 0;
//        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        _collectionViewFlowLayout = flowLayout;
//    }
//    return _collectionViewFlowLayout;
//}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        CGRect bounds = CGRectMake(0, 0, screenW * self.kGuidepageImageCount, screenH);
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionView * view = [[UICollectionView alloc] initWithFrame:bounds collectionViewLayout:layout];
        view.showsVerticalScrollIndicator = NO;
        view.showsHorizontalScrollIndicator = NO;
        view.pagingEnabled = YES;
        [self.view addSubview:view];
        view.backgroundColor = [UIColor redColor];
        
        _collectionView = view;
    }
    return _collectionView;
}

#pragma mark -- view周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.kGuidepageImageCount = 4;
    [self.collectionView registerClass:[GuidepageCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([GuidepageCollectionCell class])];
    
}

#pragma mark -- UICollectionViewDataSource方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _kGuidepageImageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GuidepageCollectionCell *cell = [GuidepageCollectionCell guidepageCollectionCellWithCcollectionView:collectionView cellForItemAtIndexPath:indexPath];
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground568h",indexPath.row + 1]];
    [cell setIndexPath:indexPath count:self.kGuidepageImageCount];
    
    return cell;
}

#pragma mark -- 接收个数
- (void)setKGuidepageImageCount:(int)kGuidepageImageCount
{
    _kGuidepageImageCount = kGuidepageImageCount;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
