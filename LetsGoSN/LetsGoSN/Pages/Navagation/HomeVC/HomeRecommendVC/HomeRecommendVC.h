//
//  HomeRecommendVC.h
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/3.
//

#import <UIKit/UIKit.h>
#import "HomeRecommendVCCell.h"
#import "HomeRecommendVCData.h"
#import "HomeRecommendHeaderView.h"
#import "HomeRecommendClickVC.h"
#import "MyViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeRecommendVC : UICollectionViewController

@property (nonatomic) NSMutableArray* dataList;
@property (nonatomic, weak) MyViewController* parentVC;
@end

NS_ASSUME_NONNULL_END
