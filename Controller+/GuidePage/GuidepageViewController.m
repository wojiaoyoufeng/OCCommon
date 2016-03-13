//
//  GuidepageViewController.m
//  OCCommon
//
//  Created by 游峰 on 16/3/4.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "GuidepageViewController.h"

@interface GuidepageViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIScrollView * guideScrollV;
@property (weak, nonatomic) UIPageControl * guidePageControl;
@property (weak, nonatomic) UIButton * startBtn;

@end

@implementation GuidepageViewController

#pragma mark -- 懒加载
- (UIScrollView *)guideScrollV
{
    if (!_guideScrollV) {
        
        UIScrollView * guideScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
        
        [self.view addSubview:guideScrollV];
        
        guideScrollV.contentSize = CGSizeMake(screenW * self.kGuidepageImageCount, screenH);
        guideScrollV.pagingEnabled = YES;
        guideScrollV.bounces = NO;
        guideScrollV.showsHorizontalScrollIndicator = NO;
        guideScrollV.delegate = self;
        guideScrollV.backgroundColor = [UIColor clearColor];
        
        
        _guideScrollV = guideScrollV;
    }
    return _guideScrollV;
}

- (UIPageControl *)guidePageControl
{
    if (!_guidePageControl) {
        
        CGFloat w = 160;
        CGFloat h = 30;
        CGFloat x = (self.guideScrollV.bounds.size.width - w) * 0.5;
        CGFloat y = self.guideScrollV.bounds.size.height - 45;
        
        UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake( x, y, w, h)];
        
        [self.view addSubview:pageControl];
        
        [pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventTouchUpInside];
        
        pageControl.numberOfPages = self.kGuidepageImageCount;
        pageControl.currentPage   = 0;
        pageControl.tintColor = [UIColor redColor];
        pageControl.userInteractionEnabled = YES;
        
        // 设置是否延迟自动更新控制器的当前页码
        pageControl.defersCurrentPageDisplay = YES;
        
        _guidePageControl = pageControl;
    }
    return _guidePageControl;
}

#pragma mark - 引导页触摸UIPageControl的方法
- (void)pageAction:(UIPageControl *)pageControl
{
    int page = (int)pageControl.currentPage;
    [self.guideScrollV setContentOffset:CGPointMake(screenW * page, 0) animated:YES];
}


#pragma mark - view方法
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self guidePageControl];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.kGuidepageImageCount = 4;

    // ============================ 引导页 ===============================
    [self setupUI];
   
}

#pragma mark - 添加UI的方法
- (void)setupUI
{
    NSString * imageName = [NSString stringWithFormat:@"guide1Background568h.png"];
    for (NSInteger i=0; i<= self.kGuidepageImageCount; i++)
    {
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(i * screenW, 0, screenW + 2, screenH)];
        [self.guideScrollV addSubview:imageV];
        imageName = [NSString stringWithFormat:@"guide%ldBackground568h.png", (i + 1)];
        [imageV setImage:[UIImage imageNamed:imageName]];
        
        if (i == (self.kGuidepageImageCount - 1))
        {
            imageV.userInteractionEnabled = YES;
            UISwipeGestureRecognizer * swipeG = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(start)];
            swipeG.direction = UISwipeGestureRecognizerDirectionLeft;
            [imageV addGestureRecognizer:swipeG]; //轻扫
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"guideStart.png"] forState:UIControlStateNormal];
            [button sizeToFit];
            [imageV addSubview:button];
            self.startBtn = button;
            [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
            button.center = CGPointMake(screenW * 0.5, screenH * 0.85);
        }
    }
}

#pragma mark -- 接收个数
- (void)setKGuidepageImageCount:(NSInteger)kGuidepageImageCount
{
    _kGuidepageImageCount = kGuidepageImageCount;
    
    self.guidePageControl.numberOfPages = kGuidepageImageCount;
}

#pragma mark - 点击按钮进入主页面
- (void)start
{
    
    UIViewController * vc = [[UIViewController alloc] init];
    [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - 引导滑动视图滑动的时候调用的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat doublePage = self.guideScrollV.contentOffset.x / self.guideScrollV.frame.size.width;
    int intPage = (int)(doublePage + 0.5);
    
    self.guidePageControl.currentPage = intPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
