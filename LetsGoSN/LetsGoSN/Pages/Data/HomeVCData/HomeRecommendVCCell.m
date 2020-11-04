//
//  HomeRecommendVCCell.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/3.
//

#import "HomeRecommendVCCell.h"

@implementation HomeRecommendVCCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLayout];
    }
    return self;
}

-(void) setLayout {
    int width = self.contentView.bounds.size.width;
    int height = self.contentView.bounds.size.height;
    int imageViewHeight = height * 2 / 3;
    int imageViewHorizonPadding = 10;
    int imageViewTopPadding = 10;
    int labelHeight = 30;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewHorizonPadding, imageViewTopPadding, width - 2 * imageViewHorizonPadding, imageViewHeight)];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, height - labelHeight, width, labelHeight)];
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.label];
    [self setBackgroundColor:[UIColor whiteColor]];
}

- (void) setData: (HomeRecommendVCData *)data {
    self.imageView.image = data.image;
    self.label.text = data.text;
}
@end


