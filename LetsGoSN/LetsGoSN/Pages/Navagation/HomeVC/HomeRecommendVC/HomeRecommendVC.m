//
//  HomeRecommendVC.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/3.
//

#import "HomeRecommendVC.h"

static const int headerViewHeight = 200;
static const int headerViewHorizonPadding = 5;
static const int headerViewTopPadding = 10;
@interface HomeRecommendVC ()

@end

@implementation HomeRecommendVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self initView];
//    [self initHeaderView];
    [self loadVideoData];
}

- (void) initView {
    [self.collectionView setBackgroundColor:[UIColor grayColor]];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[HomeRecommendVCCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[HomeRecommendHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeRecommendHeaderView"];
}

/*
- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
        for (int i = 0; i < 10; i++) {
            UIImage *img = [UIImage imageNamed:@"ic_wuliannan.png"];
            HomeRecommendVCData *data = [[HomeRecommendVCData alloc] initWithImage: img andText: @"2233"];
            [_dataList addObject:data];
        }
    }
    return _dataList;
}
*/
- (void) setParentVC:(MyViewController *)parentVC {
    _parentVC = parentVC;
}

- (void) loadVideoData {
    //method 1
    /*
    NSString *mainBundleDirectory = [[NSBundle mainBundle] bundlePath];
    NSString *path = [mainBundleDirectory stringByAppendingPathComponent:@"mockData.json"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url]; */
    
    //method 2
    NSString *path = [[NSBundle mainBundle] pathForResource:@"mockData" ofType:@"json"];
    NSData* data = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError* error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (!dic || error) {
        NSLog(@"JSON解析失败");
    }
//    NSLog(@"%@", dic);
    self.dataList = [dic objectForKey:@"videos"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewHeader>
- (void) initHeaderView {
    //top left bottom right
    float headViewActualHeight = headerViewHeight + headerViewTopPadding;
    float headViewLeftPadding = headerViewHorizonPadding;
    [self.collectionView setContentInset:UIEdgeInsetsMake(headViewActualHeight, 0, 0, 0)];
    HomeRecommendHeaderView *headView = [[HomeRecommendHeaderView alloc] initWithFrame:CGRectMake(headViewLeftPadding, -headViewActualHeight, [UIScreen mainScreen].bounds.size.width - 2 * headViewLeftPadding, headerViewHeight)];
    [self.collectionView addSubview:headView];
    [self.collectionView setContentOffset:CGPointMake(0, -headViewActualHeight)];
}


- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    //根据layout旋转方向决定只有一个生效 当为垂直旋转时只有height生效
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, headerViewHeight);
    return size;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HomeRecommendHeaderView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeRecommendHeaderView" forIndexPath:indexPath];
        float newWidth = [UIScreen mainScreen].bounds.size.width - 2 * headerViewHorizonPadding;
        float newHeight = headerViewHeight - headerViewTopPadding;
        [headView setFrame:CGRectMake(headerViewHorizonPadding, headerViewTopPadding, newWidth, newHeight)];
        reusableView = headView;
    }
    return reusableView;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeRecommendVCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSMutableDictionary *dict = self.dataList[indexPath.row];
    [cell.title setText:[dict objectForKey:@"title"]];
    [cell.playTime setText: [NSString stringWithFormat:@"Click:%@", [dict objectForKey:@"playTime"]]];
    [cell.danmakuCount setText:[NSString stringWithFormat:@"DM:%@",[dict objectForKey:@"danmakuCount"]]];
    [cell.videoTime setText:[self transfromToTime: [dict objectForKey:@"videoTime"]]];
    UIImage *img = [UIImage imageNamed:[dict objectForKey:@"videoImage"]];
    [cell.imageView setImage: img];
//    HomeRecommendVCData *data = self.dataList[indexPath.item];
//    [cell setData: data];
    return cell;
}

- (NSString *) transfromToTime: (NSString *) secondString {
    NSString *time = @"0:00";
    int second = [secondString intValue];
    if (second < 0) {
        return time;
    }
    int hour = (second / 3600) % 24;
    int minute = (second % 3600) / 60;
    if (minute < 10) {
        time = [NSString stringWithFormat:@"%d:0%d", hour, minute];
    } else {
        time = [NSString stringWithFormat:@"%d:%d", hour, minute];
    }
    return time;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeRecommendVCCell *cell = (HomeRecommendVCCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
    [self goClickVCWithCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeRecommendVCCell *cell = (HomeRecommendVCCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor whiteColor]];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) goClickVCWithCell: (HomeRecommendVCCell *) cell {
    if (self.parentVC != nil) {
        [self.parentVC removeCurrentView];
        [self.parentVC.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        HomeRecommendClickVC *newVC = [[HomeRecommendClickVC alloc] init];
        [newVC.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [newVC setImage:cell.imageView.image AndText:cell.title.text];
        [self.parentVC changeCurrentVC:newVC];
        [self.parentVC addCurrentView];
        [self.parentVC initBackButton];
    }

}

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
