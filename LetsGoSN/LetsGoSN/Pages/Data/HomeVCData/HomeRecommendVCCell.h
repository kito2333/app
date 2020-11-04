//
//  HomeRecommendVCCell.h
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/3.
//

#import <UIKit/UIKit.h>
#import "HomeRecommendVCData.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeRecommendVCCell : UICollectionViewCell

@property (nonatomic) UIImageView* imageView;
@property (nonatomic) UILabel* label;

- (void) setData: (HomeRecommendVCData *)data;
@end

NS_ASSUME_NONNULL_END
