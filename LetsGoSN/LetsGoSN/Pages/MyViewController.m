//
//  MyViewController.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/10/26.
//

#import "MyViewController.h"
#import "HeaderHomeVC.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface MyViewController ()

@property (nonatomic) float barHeight;
@property (nonatomic) UIViewController *currentVC;

@property (nonatomic) UIView *headView;
@property (nonatomic) UIButton *headLBtn;
@property (nonatomic) UIButton *headMBtn;
@property (nonatomic) UIButton *headRBtn;

@end

@implementation MyViewController

//MARK: init
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void) initView {
    self.view.backgroundColor = [UIColor systemPinkColor];
    
    [self initHeadView];
    
    HeaderHomeVC *headHome = [[HeaderHomeVC alloc] init];
    headHome.view.frame = CGRectMake(0, _headView.frame.origin.y + 50, WIDTH, HEIGHT - 130 - _barHeight);
    _currentVC = headHome;
    
    [self addChildViewController:_currentVC];
    [self.view addSubview:_currentVC.view];
    [_currentVC didMoveToParentViewController:self];
}

- (void) initHeadView {
    [self setModalPresentationStyle:UIModalPresentationFullScreen];
    
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if (window.isKeyWindow) {
            _barHeight = window.windowScene.statusBarManager.statusBarFrame.size.height;
            break;
        }
    }
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, 150)];
    _headView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_headView];
    
    float headTitleWidth = 60;
    _headLBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 - headTitleWidth * 2, 0, headTitleWidth, 50) andTile:@"同城"];
    [_headLBtn addTarget:self action:@selector(goHeadView) forControlEvents: UIControlEventTouchUpInside];
    [_headView addSubview:_headLBtn];
    
    _headMBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 - headTitleWidth / 2, 0, headTitleWidth, 50) andTile:@"关注"];
    // addTarget
    [_headView addSubview:_headMBtn];
    
    
    _headRBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 + headTitleWidth, 0, headTitleWidth, 50) andTile:@"推荐"];
    // addTarget
    [_headView addSubview:_headRBtn];
}

- (UIButton *) buttonWithFrame:(CGRect) frame andTile: (NSString* )title {
    UIButton *btn = [[UIButton alloc] initWithFrame: frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    return btn;
}

- (void) goHeadView {
    [_currentVC willMoveToParentViewController:nil];
    [_currentVC.view removeFromSuperview];
    [_currentVC removeFromParentViewController];
    
    HeaderHomeVC *headHVC = [[HeaderHomeVC alloc] init];
    headHVC.view.frame = CGRectMake(0, _headView.frame.origin.y + 50, WIDTH, HEIGHT - 130 - _barHeight);
    _currentVC = headHVC;
    
    [self addChildViewController:_currentVC];
    [self.view addSubview:_currentVC.view];
    [_currentVC didMoveToParentViewController:self];
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
