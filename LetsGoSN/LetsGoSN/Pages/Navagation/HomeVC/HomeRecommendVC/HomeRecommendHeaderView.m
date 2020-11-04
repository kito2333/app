//
//  HomeRecommendHeaderView.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/4.
//

#import "HomeRecommendHeaderView.h"

@implementation HomeRecommendHeaderView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initView];
    };
    return self;
}

- (void) initView {
    int height = self.bounds.size.height;
    int width = self.bounds.size.width;
    int imageViewHorizonPadding = 10;
    int imageViewTopPadding = 10;
    int imageViewHeight = height * 4 / 5;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewHorizonPadding, imageViewTopPadding, width - 2 * imageViewHorizonPadding, imageViewHeight)];
    [self.imageView setImage:[UIImage imageNamed:@"yyf.jpg"]];
    [self addSubview:self.imageView];
}
@end
