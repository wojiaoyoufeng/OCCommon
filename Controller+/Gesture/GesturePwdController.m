//
//  GesturePwdController.m
//  OCCommon
//
//  Created by 游峰 on 16/4/14.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "GesturePwdController.h"
#import "GesturePwdView.h"

#define kBtnH 30

@interface GesturePwdController ()<GesturePwdViewDelegate>
{
    dispatch_source_t _timer;
}
@property (weak, nonatomic) GesturePwdView * gesturePwdView;//手势view
@property (weak, nonatomic) UIButton * oneBtn;
@property (weak, nonatomic) UIButton * unlockBtn;
@property (weak, nonatomic) UIButton * modifyBtn;
@property (weak, nonatomic) UIButton * resetBtn;
@property (weak, nonatomic) UIButton * waningBtn;

@property (assign, nonatomic) CGFloat kBtnY;
@property (assign, nonatomic) CGFloat kBtnW;

@property (strong, nonatomic) NSString * tmpStr;
@property (strong, nonatomic) NSString * tooStr;

@end

BOOL _restrictions;//用来判断用户是否手势被限制
NSInteger _number;//定义错误次数
float _timing = 10.0f;  //定义错误一次加10秒
int _errorOnes = 0;//记录错误次数
float _times;//倒计时

@implementation GesturePwdController
- (void)getTimePassword
{
    _errorOnes = 0;
    self.waningBtn.hidden = NO;
    __block double timeout = 10.0f;//倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0)
        { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.waningBtn setTitle:@"解除限制,请重新输入" forState:UIControlStateNormal];
                self.gesturePwdView.userInteractionEnabled = YES;
            });
        }else
        {
            __block NSString *strTime = [NSString stringWithFormat:@"倒计时%.f秒", timeout];
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.waningBtn setTitle:strTime forState:UIControlStateNormal];
            });
            --timeout;
        }
    });
    dispatch_resume(_timer);
}

- (void)errorOnesWithMessage:(NSString *)message
{
    _errorOnes++;
    [self waningWithTitle:[NSString stringWithFormat:@"提示错误%d次" , _errorOnes] withMessage:message];
    if (_errorOnes == 5) {
        self.gesturePwdView.userInteractionEnabled = NO;
        [self getTimePassword];
    }
}

- (void)gesturePwdViewGetDrawString:(GesturePwdView *)gesturePwdView
{
    if (self.gesturePwdView.drawStr.length < 4) {
        [self errorOnesWithMessage:@"手势输入过短"];
    }else
    {
        if(self.isUnlock == YES)
        {
            self.tmpStr = self.gesturePwdView.drawStr;
            if ([self.tmpStr isEqualToString:self.pwd])
            {
                 [self waningWithTitle:@"提示" withMessage:@"手势正确！"];
                self.isUnlock = NO;
            }else
            {
                [self errorOnesWithMessage:@"手势不正确"];
            }
        }else
        {
            if(self.isOne == YES)
            {
                self.tmpStr = self.gesturePwdView.drawStr;
                [self waningWithTitle:@"绘制成功！" withMessage:@"再次绘制！"];
                self.isOne = NO;
            }else
            {
                self.tooStr = self.gesturePwdView.drawStr;
                if ([self.tmpStr isEqualToString:self.tooStr])
                {
                    self.pwd = self.tmpStr;
                    [self waningWithTitle:@"恭喜你！" withMessage:@"手势设置成功！"];
                }else
                {
                    [self errorOnesWithMessage:@"手势不一致,重新绘制"];
                }
                self.tmpStr = @"";
                self.tooStr = @"";
           }
        }
      }
}

- (void)gesturePwdViewGetBeganDraw:(GesturePwdView *)gesturePwdView
{
    self.waningBtn.hidden = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.tmpStr = @"0000";
    self.pwd = @"01258";
    [self gesturePwdView];
    self.kBtnW = [UIScreen mainScreen].bounds.size.width * 0.25;
    self.kBtnY = [UIScreen mainScreen].bounds.size.height - kBtnH;
    [self oneBtn];
    [self unlockBtn];
    [self modifyBtn];
    [self resetBtn];
    
}

//isOne;第一次
- (void)oneInstallGesturePwd
{
    [self waningWithTitle:@"提示" withMessage:@"设置手势"];
    self.isOne = YES;
    self.gesturePwdView.userInteractionEnabled = YES;
}

//isUnlock;解锁
- (void)unlockGesturePwd
{
    [self waningWithTitle:@"提示" withMessage:@"解开手势"];
    self.gesturePwdView.userInteractionEnabled = YES;
    self.isUnlock = YES;
}

//isModify;修改手势
- (void)modifyGesturePwd
{
    self.isModify = YES;
    //解锁
    [self unlockGesturePwd];
    //设置密码
    [self oneInstallGesturePwd];
}

//isRetrieveGesturePwd;重置密码
- (void)resetGesturePwd
{
    [self waningWithTitle:@"提示" withMessage:@"是否重置手势密码！"];
    self.pwd = @"";
    self.isOne = YES;
    self.isReset = YES;
    self.gesturePwdView.userInteractionEnabled = YES;
}

- (void)waningWithTitle:(NSString *)title withMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {  }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:^{  }];
}

#pragma mark -- lazy
- (GesturePwdView *)gesturePwdView
{
    if (!_gesturePwdView)
    {
        GesturePwdView * view = [[GesturePwdView alloc] init];
        [self.view addSubview:view];
        view.delegate = self;
        view.frame = CGRectMake(0, 0, 300, 300);
        view.center = self.view.center;
        view.backgroundColor = [UIColor whiteColor];
        view.userInteractionEnabled = NO;
        _gesturePwdView = view;
    }
    return _gesturePwdView;
}

- (UIButton *)waningBtn
{
    if (!_waningBtn)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake(0,30, 200, kBtnH);
        button.centerX = [UIScreen mainScreen].bounds.size.width * 0.5;
        [button addTarget:self action:@selector(oneInstallGesturePwd) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTintColor:[UIColor redColor]];
        [button setTitle:@"waning..." forState:UIControlStateNormal];
        _waningBtn = button;
    }
    return _waningBtn;
}

- (UIButton *)oneBtn
{
    if (!_oneBtn)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake(0, self.kBtnY, self.kBtnW, kBtnH);
        [button addTarget:self action:@selector(oneInstallGesturePwd) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:@"设置密码" forState:UIControlStateNormal];
        
        _oneBtn = button;
    }
    return _oneBtn;
}

- (UIButton *)unlockBtn
{
    if (!_unlockBtn)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake(self.kBtnW, self.kBtnY, self.kBtnW, kBtnH);
        [button addTarget:self action:@selector(unlockGesturePwd) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:@"解锁" forState:UIControlStateNormal];
        
        _unlockBtn = button;
    }
    return _unlockBtn;
}

- (UIButton *)modifyBtn
{
    if (!_modifyBtn)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake(self.kBtnW * 2, self.kBtnY, self.kBtnW, kBtnH);
        [button addTarget:self action:@selector(modifyGesturePwd) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:@"修改密码" forState:UIControlStateNormal];
        _modifyBtn = button;
    }
    return _modifyBtn;
}

- (UIButton *)resetBtn
{
    if (!_resetBtn)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake(self.kBtnW * 3, self.kBtnY, self.kBtnW, kBtnH);
        [button addTarget:self action:@selector(resetGesturePwd) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor grayColor]];
         [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:@"手势重置" forState:UIControlStateNormal];
        _resetBtn = button;
    }
    return _resetBtn;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
