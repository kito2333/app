//
//  HomeRecommendVC.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/3.
//

#import "HomeRecommendVC.h"
#import "HomeRecommendHeaderView.h"

static const int headerViewHeight = 200;
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
}

- (void) initView {
    [self.collectionView setBackgroundColor:[UIColor grayColor]];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[HomeRecommendVCCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[HomeRecommendHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeRecommendHeaderView"];
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
    float headViewActualHeight = 205;
    float headViewLeftPadding = 5;
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
        reusableView = headView;
    }
    return reusableView;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeRecommendVCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
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
