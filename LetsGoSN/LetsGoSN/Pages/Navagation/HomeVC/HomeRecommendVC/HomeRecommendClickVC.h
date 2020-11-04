//
//  HomeRecommendClickVC.h
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeRecommendClickVC : UIViewController

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *label;
- (void) setImage: (UIImage*) image AndText: (NSString *) text;
@end

NS_ASSUME_NONNULL_END
