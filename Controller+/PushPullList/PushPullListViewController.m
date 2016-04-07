//
//  PushPullListViewController.m
//  OCCommon
//
//  Created by 游峰 on 16/3/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "PushPullListViewController.h"
#import "PushPllListViewFlowLayout.h"
#import "PushPullListCell.h"

@interface PushPullListViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) UICollectionView * collectionView;

@end

@implementation PushPullListViewController

#pragma mark -- lazy
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        PushPllListViewFlowLayout *layout = [[PushPllListViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.itemSize = CGSizeMake( [UIScreen mainScreen].bounds.size.width, 120);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        [self.view addSubview:collectionV];
        collectionV.backgroundColor = [UIColor whiteColor];
        collectionV.dataSource = self;
        collectionV.delegate = self;
        collectionV.allowsSelection = YES;
        collectionV.allowsMultipleSelection = NO;
        [collectionV registerClass:[PushPullListCell class] forCellWithReuseIdentifier:NSStringFromClass([PushPullListCell class])];
        _collectionView = collectionV;
    }
    return _collectionView;
}


#pragma mark -- view周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self collectionView];
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PushPullListCell * cell = [PushPullListCell pushPullListCellWithCollectionView:collectionView cellForItemAtIndexPath:indexPath];
    return cell;
}

- (BOOL)shouldAutorotate
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
