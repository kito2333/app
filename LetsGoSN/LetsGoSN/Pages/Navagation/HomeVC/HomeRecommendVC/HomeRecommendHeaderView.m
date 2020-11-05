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
    _headerViewHeight = 200;
    _headerViewTopPadding = 10;
    _headerViewHorizonPadding = 5;
    int height = self.bounds.size.height;
    int width = self.bounds.size.width;
    int imageViewHeight = height - _headerViewTopPadding;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width - 2 * _headerViewHorizonPadding, imageViewHeight)];
    [self.imageView setImage:[UIImage imageNamed:@"yyf.jpg"]];
    [self addSubview:self.imageView];
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:YES];
}
@end
