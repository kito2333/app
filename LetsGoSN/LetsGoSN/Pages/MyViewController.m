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
static const int homeRecommendVCLineSpacing = 10;
static const int homeRecommendVCInterItemSpacing = 10;
static const int homeRecommendVCCellHeight = 150;

@interface MyViewController ()

@property (nonatomic) float barHeight;
@property (nonatomic) UIViewController *currentVC;
@property (nonatomic) UIButton *backButton;

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initHomeTopView];
    [self initBottomView];
    [self initHomeRecommendVC];
    [self addCurrentView];
}

- (void) initBottomView {
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 80, WIDTH, 50)];
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: _bottomView];
    
    float bottomButtonWidth = 80 > WIDTH / 6 ? 80 : WIDTH / 6;
    float bottomButtonHeight = 50;
    _bottomFirstBtn = [self buttonWithFrame:CGRectMake(WIDTH / 6 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"首页"];
    [_bottomFirstBtn addTarget:self action:@selector(goHomeVC) forControlEvents:UIControlEventTouchUpInside];
    [_bottomFirstBtn setSelected:YES];
    [_bottomView addSubview: _bottomFirstBtn];
    
    _bottomSecondBtn = [self buttonWithFrame:CGRectMake(WIDTH / 3 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"频道"];
    [_bottomSecondBtn addTarget:self action:@selector(goChannelVC) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview: _bottomSecondBtn];
    
    _bottomThirdBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"频道"];
    [_bottomView addSubview: _bottomThirdBtn];
    
    _bottomForthBtn = [self buttonWithFrame:CGRectMake(WIDTH * 2 / 3 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"会员购"];
    [_bottomForthBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [_bottomView addSubview: _bottomForthBtn];
    
    _bottomFifthBtn = [self buttonWithFrame:CGRectMake(WIDTH * 5 / 6 - bottomButtonWidth / 2, 0, bottomButtonWidth, bottomButtonHeight) andTile:@"我的"];
    [_bottomView addSubview: _bottomFifthBtn];
    
}

- (void) initBackButton {
    _backButton = [self buttonWithFrame:CGRectMake(0, 50, 50, 50) andTile:@"Back"];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(goHomeVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
}

- (UIButton *) buttonWithFrame:(CGRect) frame andTile: (NSString* )title {
    UIButton *btn = [[UIButton alloc] initWithFrame: frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor systemPinkColor] forState: UIControlStateSelected];
    [btn setTitleColor:[UIColor systemPinkColor] forState: UIControlStateSelected];
    [btn setTitleColor:[UIColor systemPinkColor] forState:UIControlStateHighlighted];
    return btn;
}

#pragma mark - navigation of Home

- (void) initHomeTopView {
    [self setModalPresentationStyle:UIModalPresentationFullScreen];
   
    /*
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if (window.isKeyWindow) {
            _barHeight = window.windowScene.statusBarManager.statusBarFrame.size.height;
            break;
        }
    } */
    
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
    [_headMBtn setSelected:YES];
    [_headView addSubview:_headMBtn];
    
    
    _headRBtn = [self buttonWithFrame:CGRectMake(WIDTH / 2 + headButtonWidth, 0, headButtonWidth, headButtonHeight) andTile:@"热门"];
    [_headRBtn addTarget:self action:@selector(goHotView) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_headRBtn];
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
    [homeRecommendVC setParentVC:self];
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

- (void) goHomeVC {
    if ([self isHomeVC]) {
        return;
    }
    [self removeCurrentView];
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self initHomeTopView];
    [self initBottomView];
    [self updateButtonSelectedWithNumberForBottomView:1];
    [self initHomeRecommendVC];
    [self addCurrentView];
    
}

- (void) goRecommendView {
    [self removeCurrentView];
    [self initHomeRecommendVC];
    [self updateButtonSelectedWithNumberForHomeTopView:2];
    [self addCurrentView];
}

- (void) goLiveView {
    [self removeCurrentView];
    [self initHomeLiveVC];
    [self updateButtonSelectedWithNumberForHomeTopView:1];
    [self addCurrentView];
}

- (void) goHotView {
    [self removeCurrentView];
    [self initHomeHotVC];
    [self updateButtonSelectedWithNumberForHomeTopView:3];
    [self addCurrentView];
}

- (void) changeCurrentVC:(id)newVC {
    if ([newVC isKindOfClass:[HomeRecommendClickVC class]]) {
        _currentVC = newVC;
    }
}

#pragma mark - navigation of Channel

-(void) initChannelTopView {
    [self setModalPresentationStyle:UIModalPresentationFullScreen];
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, 50)];
    _headView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_headView];
    
    float headButtonWidth = 60;
    float headButtonHeight = 50;
    _headLBtn = [self buttonWithFrame:CGRectMake(WIDTH / 3 - headButtonWidth / 2, 0, headButtonWidth, headButtonHeight) andTile:@"频道"];
    [_headLBtn addTarget:self action:@selector(goChannelView) forControlEvents: UIControlEventTouchUpInside];
    [_headView addSubview:_headLBtn];
    [_headLBtn setSelected:YES];
    
    _headRBtn = [self buttonWithFrame:CGRectMake(WIDTH * 2 / 3 - headButtonWidth / 2, 0, headButtonWidth, headButtonHeight) andTile:@"分区"];
    [_headRBtn addTarget:self action:@selector(goZoneView) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_headRBtn];
}

- (void) initChannelHomeVC {
    ChannelHomeVC *channelVC = [[ChannelHomeVC alloc] init];
    [channelVC.view setFrame:CGRectMake(0, _headView.frame.origin.y + homeVCTopPadding, WIDTH, HEIGHT - homeVCBottomPadding - _barHeight)];
    _currentVC = channelVC;
}

- (void) initChannelZoneVC {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    ChannelZoneVC *zoneVC = [[ChannelZoneVC alloc] initWithCollectionViewLayout:flowLayout];
    [zoneVC.view setFrame:CGRectMake(0, _headView.frame.origin.y + homeVCTopPadding, WIDTH, HEIGHT - homeVCBottomPadding - _barHeight)];
    _currentVC = zoneVC;
}

- (void) goChannelVC {
    if ([self isChannelVC]) {
        return;
    }
    [self removeCurrentView];
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self initChannelTopView];
    [self initBottomView];
    [self updateButtonSelectedWithNumberForBottomView:2];
    [self initChannelHomeVC];
    [self addCurrentView];
}

- (void) goChannelView {
    [self removeCurrentView];
    [self initChannelHomeVC];
    [self updateButtonSelectedWithNumberForChannelTopView:1];
    [self addCurrentView];
}

- (void) goZoneView {
    [self removeCurrentView];
    [self initChannelZoneVC];
    [self updateButtonSelectedWithNumberForChannelTopView:2];
    [self addCurrentView];
}

#pragma mark -judge function

- (BOOL) isHomeVC {
    if ([_currentVC isKindOfClass: [HomeRecommendVC class]] ||
        [_currentVC isKindOfClass: [HomeLiveVC class]] ||
        [_currentVC isKindOfClass: [HomeHotVC class]]) {
        return YES;
    }
    return NO;
}

- (BOOL) isChannelVC {
    if ([_currentVC isKindOfClass: [ChannelHomeVC class]] ||
        [_currentVC isKindOfClass: [ChannelZoneVC class]]) {
        return YES;
    }
    return NO;
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

- (void) updateButtonSelectedWithNumberForHomeTopView: (int) index {
    [_headLBtn setSelected:NO];
    [_headMBtn setSelected:NO];
    [_headRBtn setSelected:NO];
    switch (index) {
        case 1:
            [_headLBtn setSelected:YES];
            break;
        case 2:
            [_headMBtn setSelected:YES];
            break;
        case 3:
            [_headRBtn setSelected:YES];
            break;
        default:
            break;
    }
}

- (void) updateButtonSelectedWithNumberForChannelTopView: (int) index {
    [_headLBtn setSelected:NO];
    [_headRBtn setSelected:NO];
    switch (index) {
        case 1:
            [_headLBtn setSelected:YES];
            break;
        case 2:
            [_headRBtn setSelected:YES];
            break;
        default:
            break;
    }
}

- (void) updateButtonSelectedWithNumberForBottomView: (int) index {
    [_bottomFirstBtn setSelected:NO];
    [_bottomSecondBtn setSelected:NO];
    [_bottomThirdBtn setSelected:NO];
    [_bottomForthBtn setSelected:NO];
    [_bottomFifthBtn setSelected:NO];
    switch (index) {
        case 1:
            [_bottomFirstBtn setSelected:YES];
            break;
        case 2:
            [_bottomSecondBtn setSelected:YES];
            break;
        case 3:
            [_bottomThirdBtn setSelected:YES];
            break;
        case 4:
            [_bottomForthBtn setSelected:YES];
            break;
        case 5:
            [_bottomFifthBtn setSelected:YES];
            break;;
        default:
            break;
    }
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
