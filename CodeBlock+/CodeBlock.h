//
//  CodeBlock.h
//  OCCommon
//
//  Created by 游峰 on 16/3/1.
//  Copyright © 2016年 yf. All rights reserved.
//

        //=================== 培育技术阅读的习惯 ===================
        //=================== 培育阅读的习惯----接收新知识新技术的类型的人才  ===================

/**
 此代码块, 为了直接养成个人代码习惯, 节约时间, 使用方便
 
 代码片段的备份
 Xcode中的代码片段默认放在下面的目录中：
 ~/Library/Developer/Xcode/UserData/CodeSnippets
 
 将目录中的代码片段备份，也可以将其直接拷出来放在不同的电脑上使用。
 
 */

/**
 在“Finder”中找到“应用程序”，然后找到“Xcode.app”，右键“显示包内容”
 
 找到这个路径：/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source/Cocoa Touch Class.xctemplate/NSObjectObjective-C
 
 修改里面文件模板或者项目模板中的内容，完全可以自定义
 
 */

// ============  Objective-C  ==============

// /** */星星注释 youf
/** <#desc...#> */
// 标注#pragma
pragma mark -- <#desc...#>
// Zidongtishihong自动提示宏 zidongtishihong
#define HFkeyPath(objc, keyPath) @(((void)objc.keyPath, #keyPath))

// 加载xib xibLoad
[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];

// Weak属性生成 weakpro
@property (weak, nonatomic) <#type#> * <#name#>
// Strong属性生成 strongpro
@property (strong, nonatomic) <#class#> * <#name#>
// Assign属性生成 assignpro
@property (assign, nonatomic) <#type#> <#name#>
// Copy属性生成 copypro
@property (copy, nonatomic) <#type#> * <#name#>
// Delegate属性生成 delegatepro
@property (weak, nonatomic) id<<#protocol#>> delegate<#jump#>

// Button控件生成 initButton
UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
[<#view#> addSubview:button];
button.frame = CGRectMake(<#0#>, <#0#>, <#0#>, <#0#>);
[button addTarget:<#(nullable id)#> action:@selector(<#selector#>) forControlEvents:UIControlEve<#event#>];

[button setBackgroundColor:[UIColor <#color#>]];
[button setBackgroundImage:[UIImage <#image#>] forState:UIControlState<#state#>];

[button setImage:[UIImage <#image#>] forState:UIControlState<#state#>];

[button setTintColor:[UIColor <#color#>]];
[button setTitle:<#(nullable NSString *)#> forState:UIControlState<#state#>];

[button setTag:100 + <#1#>];

UIEdgeInsets edgeInsets = UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>);

[button setImageEdgeInsets:<#(UIEdgeInsets)#>];
[button setTitleEdgeInsets:<#(UIEdgeInsets)#>];

button.enabled = YES;

// ImageView控件生成 initImageview
UIImageView * imageV = [[UIImageView alloc] init];
[<#view#> addSubview:imageV];
imageV.frame = CGRectMake(<#0#>, <#0#>, <#0#>, <#0#>);
imageV.backgroundColor = [UIColor whiteColor];
[imageV setImage:[UIImage <#image#>]];
[imageV setHighlightedImage:[UIImage <#image#>]];

// Label控件生成 initLabel
UILabel * label = [[UILabel alloc] init];
[<#view#> addSubview:label];
label.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
label.numberOfLines = 0;
[label setFont:[UIFont <#font#>]];
[label setTextColor:[UIColor <#color#>]];
[label setTextAlignment:NSTextAlignmen<#center#>];
[label setBackgroundColor:[UIColor <#color#>]];
label.text = <#text#>

// View控件生成 initView
UIView * view = [[UIView alloc] init];
[<#view#> addSubview:view];
view.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
view.backgroundColor = [UIColor <#color#>];

// Layer设置边框圆角 initLayer
<#name#>.layer.borderColor = [UIColor <#color#>];
<#name#>.layer.borderWidth = <#0#>
<#name#>.layer.cornerRadius = <#0#>
<#name#>.layer.masksToBounds = YES;

// Xywh定义 whxy
CGFloat w = <#float#>
CGFloat h = <#float#>
CGFloat x = <#float#>
CGFloat y = <#float#>

// UIScrollView生成 initScrollView
UIScrollView * scrollV = [[UIScrollView alloc] init];
[<#view#> addSubview:scrollV];
scrollV.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
scrollV.delegate = self;
scrollV.backgroundColor = [UIColor <#color#>];
scrollV.contentOffset = CGPointMake(<#CGFloat x#>, <#CGFloat y#>);
scrollV.contentSize = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>);
UIEdgeInsets edgeInsets = UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>);
scrollV.contentInset = edgeInsets;
scrollV.directionalLockEnabled = NO;
scrollV.bounces = NO;
scrollV.alwaysBounceVertical = NO;
scrollV.alwaysBounceHorizontal = NO;
scrollV.pagingEnabled = YES;
scrollV.scrollEnabled = YES;
scrollV.showsHorizontalScrollIndicator = NO;
scrollV.showsVerticalScrollIndicator = NO;
/** 通常不设置
 scrollV.scrollIndicatorInsets = UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>);
 scrollV.indicatorStyle = UIScrollViewIndicatorStyleDefault;
 scrollV.decelerationRate = <#float#>;
 scrollV.tracking = YES;
 scrollV.dragging = YES;
 scrollV.decelerating = YES;
 scrollV.delaysContentTouches = YES;
 scrollV.canCancelContentTouches = YES;
 scrollV.minimumZoomScale = <#float#>;
 scrollV.maximumZoomScale = <#float#>;
 scrollV.bouncesZoom = YES;
 scrollV.zooming = YES;
 scrollV.zoomBouncing = YES;
 scrollV.scrollsToTop = YES;
 scrollV.directionalPressGestureRecognizer = <#UIGestureRecognizer#>;
 scrollV.keyboardDismissMode = UIScrollViewKeyboardDismissModeNone;
 */

// UITableview生成 initTableView
UITableView * tableV = [[UITableView alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>) style:UITableViewStyl<#style#>];
[self.view addSubview:tableV];
tableV.delegate = self;
tableV.dataSource = self;
tableV.rowHeight = <#float#>;
tableV.sectionHeaderHeight = <#float#>;
tableV.sectionFooterHeight = <#float#>;
tableV.estimatedRowHeight = <#float#>;
tableV.estimatedSectionHeaderHeight = <#float#>;
tableV.estimatedSectionFooterHeight = <#float#>;
/** 通常不设置
 tableV.separatorInset = UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>);
 tableV.backgroundView = <#view#>;
 tableV.editing = NO;
 tableV.allowsSelection = YES;
 tableV.allowsMultipleSelection = NO;
 tableV.allowsMultipleSelectionDuringEditing  = NO;
 tableV.indexPathForSelectedRow = <#NSIndexPath#>;
 tableV.indexPathsForSelectedRows = <#NSArray<NSIndexPath *> #>;
 tableV.sectionIndexMinimumDisplayRowCount = <#NSInteger#>;
 tableV.sectionIndexColor =  [UIColor <#color#>];
 tableV.sectionIndexBackgroundColor =  [UIColor <#color#>];
 tableV.sectionIndexTrackingBackgroundColor = [UIColor <#color#>];
 tableV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
 tableV.separatorColor = [UIColor <#color#>];
 tableV.separatorEffect = <#UIVisualEffect#>; //毛玻璃效果
 tableV.cellLayoutMarginsFollowReadableWidth = NO;
 */
tableV.tableHeaderView = <#view#>;
tableV.tableFooterView = <#view#>;
tableV.remembersLastFocusedIndexPath = NO;

[tableV registerClass:[<#class#> class] forCellReuseIdentifier:<#(nonnull NSString *)#>];
[tableV registerClass:[<#class#> class] forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>];

// UICollectionView生成 initCollectView
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

UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
[<#view#> addSubview:collectionV];
collectionV.backgroundView = <#view#>
collectionV.backgroundColor = [UIColor whiteColor];
collectionV.dataSource = self;
collectionV.delegate = self;
collectionV.allowsSelection = YES;
collectionV.allowsMultipleSelection = NO;
[collectionV registerClass:[<#Object#> class] forCellWithReuseIdentifier:<#identifier#>];

// TOWeb页面跳转 toWebView
TOWebViewController * <#name#>Vc = [[TOWebViewController alloc] initWithURL:[NSURL URLWithString:<#URL#>]];
/** 通常不用设置
<#VCname#>.webView;
<#VCname#>.showLoadingBar = YES;
<#VCname#>.showUrlWhileLoading = YES;
<#VCname#>.loadingBarTintColor = [UIColor <#color#>];
<#VCname#>.navigationButtonsHidden = NO;
<#VCname#>.showActionButton = YES;
<#VCname#>.showDoneButton = YES;
<#VCname#>.doneButtonTitle = <#text#>
<#VCname#>.disableContextualPopupMenu = YES;
<#VCname#>.hideWebViewBoundaries = YES;
<#VCname#>.buttonTintColor = [UIColor <#color#>];
*/
<#VCname#>.showPageTitles = NO;//隐藏原来的导航
UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:<#VCname#>];
nav.navigationBar.barTintColor = [UIColor <#color#>];

UINavigationBar * bar = <#VCname#>.navigationController.navigationBar;
[bar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor <#color#>], NSForegroundColorAttributeName,nil]];
bar.tintColor = [UIColor <#color#>];
if([[[Device sharedDevice] getCurrentLanguage] containsString:@"zh-Hans"])
{
    <#VCname#>.title = <#text#>;
}
else
{
    <#VCname#>.title = <#text#>;
}

<#VCname#>.modalPresentationStyle = UIModalPresentationFullScreen;
<#VCname#>.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

[self presentViewController:nav animated:YES completion:nil];


// UISearchBar生成 initSearchBar
UISearchBar * Sbar = [[UISearchBar alloc] init];
[<#view#> addSubview:Sbar];
Sbar.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
Sbar.delegate = self;
Sbar.barStyle = UIBarStyleDefault;
Sbar.showsBookmarkButton = YES;
Sbar.showsCancelButton = YES;
Sbar.showsSearchResultsButton = YES;

Sbar.backgroundColor = [UIColor <#color#>];
[Sbar setBackgroundImage:[UIImage <#image#>]];
[Sbar setImage:[UIImage <#image#>] forSearchBarIcon:<#(UISearchBarIcon)#> state:UIControlState<#state#>];

Sbar.barTintColor = [UIColor <#color#>];
Sbar.tintColor = [UIColor <#color#>];
Sbar.prompt = <#text#>;
Sbar.placeholder = <#text#>;

// 索引字符
NSArray *arr = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"];


// IfDelegate代理监听 ifDelegate
if([self.delegate respondsToSelector:@selector(<#selector#>)]){
   [self.delegate <#selector#>];<#jump#>
}

// InitModel.h定义模型 initModel.h
+ (instancetype)<#model#>
+ (instancetype)<#model#>WintDict:(NSDictionary *)dict<#jump#>
- (instancetype)initWithDict:(NSDictionary *)dict<#jump#>

// InitModel.m实例模型 initModel.m
+ (instancetype)<#model#>{
    
    return [[[self class] alloc] init];
}

+ (instancetype)<#model#>WintDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

// InitModel初始化模型 initModel
- (instancetype)init
{
    if (self = [super init]) {
        
        self.<#name#> = @"";
        self.<#name#>
    }
    return self;
}


// Lazy懒加载 lazy
- <#name#>
{
    if (!_<#name#>) {
        
        
        _<#name#> = <#impl...#>
    }
    return _<#name#>;
}

// fori循环 fori
for (<#int#> i = 0; i < <#count#>; i++){
    
    <#wirte#>
}
// foyf循环 foyf
for (<#int#> j = 0; j < <#count#>; j++){
    
    <#wirte#>
}
    

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CodeBlock : NSObject





















@end
