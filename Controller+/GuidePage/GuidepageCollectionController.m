//
//  GuidepageCollectionController.m
//  OCCommon
//
//  Created by 游峰 on 16/3/11.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "GuidepageCollectionController.h"
#import "GuidepageCollectionCell.h"

@interface GuidepageCollectionController ()

@property (weak, nonatomic) UIImageView * guideImageV;
@property (weak, nonatomic) UIImageView * guideLineV;
@property (weak, nonatomic) UIImageView * smallTextImageV;
@property (weak, nonatomic) UIImageView * largeTextImageV;
@property (assign, nonatomic) CGFloat offsetX;

@end

@implementation GuidepageCollectionController

#pragma mark -- lazy
- (UIImageView *)guideImageV
{
    if (!_guideImageV) {
        
        UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1.png"]];
        [self.collectionView addSubview:imageV];
        imageV.centerX = self.view.centerX;
        imageV.backgroundColor = [UIColor clearColor];
        
        _guideImageV = imageV;
    }
    return _guideImageV;
}

- (UIImageView *)guideLineV
{
    if (!_guideLineV) {
        
        UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine.png"]];
        [self.collectionView addSubview:imageV];
        imageV.backgroundColor = [UIColor clearColor];
        imageV.x -= self.view.width * 0.47;
        
        _guideLineV = imageV;
    }
    return _guideLineV;
}

- (UIImageView *)largeTextImageV
{
    if (!_largeTextImageV) {
        
        UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1.png"]];
        [self.collectionView addSubview:imageV];
        imageV.y = self.view.height * 0.7;
        imageV.centerX = self.view.centerX;
        imageV.backgroundColor = [UIColor clearColor];
        _largeTextImageV = imageV;
    }
    return _largeTextImageV;
}


- (UIImageView *)smallTextImageV
{
    if (!_smallTextImageV) {
        
        UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1.png"]];
        [self.collectionView addSubview:imageV];
        imageV.y = self.view.height * 0.8;
        imageV.centerX = self.view.centerX;
        imageV.backgroundColor = [UIColor clearColor];
        
        _smallTextImageV = imageV;
    }
    return _smallTextImageV;
}

#pragma mark -- 初始化方法
- (instancetype)init
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [self initWithCollectionViewLayout:layout];
}

#pragma mark -- view周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    [self.collectionView registerClass:[GuidepageCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([GuidepageCollectionCell class])];
    
    
    // Do any additional setup after loading the view.
    
    self.kGuidepageImageCount = 4;
    [self collectionView];
    
//    [self guideImageV];
    [self guideLineV];
    [self largeTextImageV];
    [self smallTextImageV];

}

#pragma mark -- 滚动视图
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;// 获取当前偏移量
    CGFloat offsetGap = offsetX - self.offsetX;// 获取偏移量差
    
    self.guideImageV.x += 2 * offsetGap;// guideImageV
    self.largeTextImageV.x += 2 * offsetGap;// largeText
    self.smallTextImageV.x += 2 * offsetGap;// smallText
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.guideImageV.x -= offsetGap;
        self.largeTextImageV.x -= offsetGap;
        self.smallTextImageV.x -= offsetGap;
    }];
    
    // 切换图片
    int page = offsetX / self.view.width + 1;
    
    self.guideImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    self.largeTextImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d",page]];
    self.smallTextImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d",page]];
    
    _offsetX = offsetX;
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.kGuidepageImageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GuidepageCollectionCell *cell = [GuidepageCollectionCell guidepageCollectionCellWithCcollectionView:collectionView cellForItemAtIndexPath:indexPath];
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground568h.png",indexPath.row + 1]];
    [cell setIndexPath:indexPath count:self.kGuidepageImageCount];
    
    return cell;
}

#pragma mark -- 接收个数
- (void)setKGuidepageImageCount:(NSInteger)kGuidepageImageCount
{
    _kGuidepageImageCount = kGuidepageImageCount;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
