//
//  MyViewController.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/10/26.
//

#import "MyViewController.h"
#import "HomeLiveVC.h"
#import "HomeRecommendVC.h"
#import "HomeHotVC.h"
#import "ChannelHomeVC.h"
#import "ChannelZoneVC.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

static const int homeVCTopPadding = 50;
static const int homeVCBottomPadding = 180;
static const int homeRecommendVCLineSpacing = 5;
static const int homeRecommendVCInterItemSpacing = 10;
static const int homeRecommendVCCellHeight = 100;

@interface MyViewController ()

@property (nonatomic) float barHeight;
@property (nonatomic) UIViewController *currentVC;

@property (nonatomic) UIView *headView;
@property (nonatomic) UIButton *headLBtn;
@property (nonatomic) UIButton *headMBtn;
@property (nonatomic) UIButton *headRBtn;

@property (nonatomic) UIView *bottomView;
@property (nonatomic) UIButton *bottomFirstBtn;
@property (nonatomic) UIButton *bottomSecondBtn;
@property (nonatomic) UIButton *bottomThirdBtn;
@property (nonatomic) UIButton *bottomForthBtn;
@property (nonatomic) UIButton *bottomFifthBtn;
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
    [self initBottomView];
    [self initHomeRecommendVC];
    
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
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, 50)];
    _headView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_headView];
    
    float headButtonWidth = 60;
    float headButtonHeight = 50;
    _headLBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 - headButtonWidth * 2, 0, headButtonWidth, headButtonHeight) andTile:@"直播"];
    [_headLBtn addTarget:self action:@selector(goLiveView) forControlEvents: UIControlEventTouchUpInside];
    [_headView addSubview:_headLBtn];
    
    _headMBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 - headButtonWidth / 2, 0, headButtonWidth, headButtonHeight) andTile:@"推荐"];
    [_headMBtn addTarget:self action:@selector(goRecommendView) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_headMBtn];
    
    
    _headRBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 + headButtonWidth, 0, headButtonWidth, headButtonHeight) andTile:@"热门"];
    [_headRBtn addTarget:self action:@selector(goHotView) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_headRBtn];
}

- (void) initBottomView {
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 80, WIDTH, 50)];
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: _bottomView];
    
    float bottomButtonWidth = 80 > WIDTH / 6 ? 80 : WIDTH / 6;
    float bottomButtonHeight = 50;
    _bottomFirstBtn = [self buttonWithFrame:CGRectMake(WIDTH / 6 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"首页"];
    [_bottomView addSubview: _bottomFirstBtn];
    
    _bottomSecondBtn = [self buttonWithFrame:CGRectMake(WIDTH / 3 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"频道"];
    [_bottomView addSubview: _bottomSecondBtn];
    
    _bottomThirdBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"频道"];
    [_bottomView addSubview: _bottomThirdBtn];
    
    _bottomForthBtn = [self buttonWithFrame:CGRectMake(WIDTH * 2 / 3 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"会员购"];
    [_bottomForthBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [_bottomView addSubview: _bottomForthBtn];
    
    _bottomFifthBtn = [self buttonWithFrame:CGRectMake(WIDTH * 5 / 6 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"我的"];
    [_bottomView addSubview: _bottomFifthBtn];
    
}

- (void) initHomeRecommendVC {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    float flowLayoutLeftPadding = 5;
    float flowLayoutTopPadding = 10;
    float flowLayoutBottomPadding = 10;
    [flowLayout setMinimumLineSpacing: homeRecommendVCLineSpacing];
    [flowLayout setMinimumInteritemSpacing:homeRecommendVCInterItemSpacing];
    [flowLayout setItemSize:CGSizeMake((WIDTH - homeRecommendVCInterItemSpacing - flowLayoutLeftPadding * 2) / 2, homeRecommendVCCellHeight)];
    [flowLayout setSectionInset:UIEdgeInsetsMake(flowLayoutTopPadding, flowLayoutLeftPadding, flowLayoutBottomPadding, flowLayoutLeftPadding)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    HomeRecommendVC *homeRecommendVC = [[HomeRecommendVC alloc] initWithCollectionViewLayout:flowLayout];
    [homeRecommendVC.view setFrame:CGRectMake(0, _headView.frame.origin.y + homeVCTopPadding, WIDTH, HEIGHT - homeVCBottomPadding - _barHeight)];
    _currentVC = homeRecommendVC;
}

- (void) initHomeLiveVC {
    HomeLiveVC *homeLiveVC = [[HomeLiveVC alloc] init];
    [homeLiveVC.view setFrame: CGRectMake(0, _headView.frame.origin.y + homeVCTopPadding, WIDTH, HEIGHT - homeVCBottomPadding - _barHeight)];
    _currentVC = homeLiveVC;
}

- (void) initHomeHotVC {
    HomeHotVC *homeHotVC = [[HomeHotVC alloc] init];
    [homeHotVC.view setFrame:CGRectMake(0, _headView.frame.origin.y + homeVCTopPadding, WIDTH, HEIGHT - homeVCBottomPadding - _barHeight)];
    _currentVC = homeHotVC;
}

- (UIButton *) buttonWithFrame:(CGRect) frame andTile: (NSString* )title {
    UIButton *btn = [[UIButton alloc] initWithFrame: frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    return btn;
}


- (void) goRecommendView {
    [self removeCurrentView];
    [self initHomeRecommendVC];
    [self addCurrentView];
}

- (void) goLiveView {
    [self removeCurrentView];
    [self initHomeLiveVC];
    [self addCurrentView];
}

- (void) goHotView {
    [self removeCurrentView];
    [self initHomeHotVC];
    [self addCurrentView];
}

#pragma mark - UpdateView

- (void) removeCurrentView {
    [_currentVC willMoveToParentViewController:nil];
    [_currentVC.view removeFromSuperview];
    [_currentVC removeFromParentViewController];
}

- (void) addCurrentView {
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
