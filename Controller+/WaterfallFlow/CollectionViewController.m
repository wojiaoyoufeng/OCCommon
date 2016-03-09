//
//  CollectionViewController.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#define YZGuidePageCount 4
#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController ()

@property (nonatomic, weak) UIImageView *guideView;
@property (nonatomic, weak) UIImageView *smallText;
@property (nonatomic, weak) UIImageView *largeText;
@property (nonatomic, assign) CGFloat offsetX;

@end

@implementation CollectionViewController

- (instancetype)init
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.delegage = self;
    layout.minimumLineSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.estimatedItemSize = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>);
    layout.headerReferenceSize = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>);
    layout.footerReferenceSize = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>);
    layout.sectionInset = UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>);
    layout.sectionHeadersPinToVisibleBounds = NO;
    layout.sectionFootersPinToVisibleBounds = NO;
    
    return [self initWithCollectionViewLayout:layout];
}


static NSString * collectionViewCellId = @"CollectionViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellId];
    
    // Do any additional setup after loading the view.
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    [self setUpGuide];// 添加guide
    [self setUpGuideLine];// 添加线
    [self setUpGuideLargeText];// LargeText
    [self setUpGuideSmallText];// SmallText
}

#pragma mark <UICollectionViewDataSource>

// 添加guide
- (void)setUpGuide
{
    
    UIImageView *guideView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1.png"]];
    
    guideView.centerX = self.view.centerX;
    _guideView = guideView;
    
    [self.collectionView addSubview:guideView];
}

// GuideLine
- (void)setUpGuideLine
{
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine.png"]];
    guideLine.x -= self.view.width * 0.47;
    [self.collectionView addSubview:guideLine];
}


// LargeText
- (void)setUpGuideLargeText
{
    UIImageView *largeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1.png"]];
    _largeText = largeText;
    
    largeText.y = self.view.height * 0.7;
    largeText.centerX = self.view.centerX;
    
    [self.collectionView addSubview:largeText];
    
}


// 添加SmallText
- (void)setUpGuideSmallText
{
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1.png"]];
    
    _smallText = smallText;
    
    smallText.y = self.view.height * 0.8;
    smallText.centerX = self.view.centerX;
    
    [self.collectionView addSubview:smallText];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;// 获取当前偏移量
    CGFloat offsetGap = offsetX - _offsetX;// 获取偏移量差
    _guideView.x += 2 * offsetGap;// guideView
    _largeText.x += 2 * offsetGap;// largeText
    _smallText.x += 2 * offsetGap;// smallText
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _guideView.x -= offsetGap;
        _largeText.x -= offsetGap;
        _smallText.x -= offsetGap;
    }];
    
    // 切换图片
    int page = offsetX / self.view.width + 1;
    _guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d.png",page]];
    _largeText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d.png",page]];
    _smallText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d.png",page]];
    
    _offsetX = offsetX;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
//    return 1;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return YZGuidePageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
//    if (!cell) {
//        cell = [CollectionViewCell collectionViewCell];
//    }
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
    
    if (!cell) {
                cell = [[UICollectionViewCell alloc] init];
            }
    
//    [cell setim]cell.imageView.image = [UIImage imageNamed:@"guide4Background568h.png"]];
    
//    [cell setImage:[UIImage imageNamed:@"guide4Background568h.png"]];
    
//    [cell setIndexPath:indexPath count:YZGuidePageCount];
    
//    cell.toImage = [UIImage imageNamed:@"guide4Background568h.png"];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 50)];
    view.backgroundColor = [UIColor redColor];
    
//    cell.toImage
    
    cell.backgroundView = view;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
