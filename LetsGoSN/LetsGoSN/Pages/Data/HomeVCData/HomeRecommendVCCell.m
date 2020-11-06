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
    int imageViewHorizonPadding = 0;
    int imageViewTopPadding = 0;
    
    int labelHeight = height / 6;
    int titleHorizonPadding = width / 25;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewHorizonPadding, imageViewTopPadding, width - 2 * imageViewHorizonPadding, imageViewHeight)];
//    [self.imageView.layer setCornerRadius:5];
//    [self.imageView.layer setMasksToBounds:YES];
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(titleHorizonPadding, height - 2 * labelHeight, width - 2 * titleHorizonPadding, labelHeight)];
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.title];
    
    [self initPlayInfoLabelWithHeight:height AndWidth:width AndLabelHeight:labelHeight];
    
    
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:YES];
    [self.contentView.layer setBorderWidth:0.5];
    [self.contentView.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.contentView.layer setMaskedCorners: YES];
}

- (void) initPlayInfoLabelWithHeight: (int) height AndWidth: (int) width AndLabelHeight: (int) labelHeight{
    int playTimeHorizonPadding = width / 25;
    int playLabelHeight = height / 15;
    int yPosition = height - 2 * labelHeight - playLabelHeight - 10;
    int playLabelWidth = width / 2;
    
    self.playTime = [[UILabel alloc] initWithFrame:CGRectMake(playTimeHorizonPadding, yPosition, playLabelWidth, playLabelHeight)];
    [self.playTime setFont:[UIFont systemFontOfSize:13]];
    [self.playTime setText: [NSString stringWithFormat:@"Click:%d", 0]];
    [self.playTime setTextColor:[UIColor whiteColor]];
    [self.playTime adjustsFontSizeToFitWidth];
    
    int danmakuLabelWidth = width / 3;
    self.danmakuCount = [[UILabel alloc] initWithFrame:CGRectMake(width * 59 / 100 - danmakuLabelWidth / 2, yPosition, danmakuLabelWidth, playLabelHeight)];
    [self.danmakuCount setFont:[UIFont systemFontOfSize:13]];
    [self.danmakuCount setText:[NSString stringWithFormat:@"DM:%d", 0]];
    [self.danmakuCount setTextColor:[UIColor whiteColor]];
    [self.danmakuCount adjustsFontSizeToFitWidth];
    
    int videoLabelWidth = width / 6;
    int videoLabelWidthRightPadding = 10;
    self.videoTime = [[UILabel alloc] initWithFrame:CGRectMake(width - videoLabelWidth - videoLabelWidthRightPadding, yPosition, videoLabelWidth, playLabelHeight)];
    [self.videoTime setFont:[UIFont systemFontOfSize:13]];
    [self.videoTime setText:[NSString stringWithFormat:@"%d:00", 0]];
    [self.videoTime setTextColor:[UIColor whiteColor]];
    [self.videoTime adjustsFontSizeToFitWidth];
    
    [self.contentView addSubview:self.playTime];
    [self.contentView addSubview:self.danmakuCount];
    [self.contentView addSubview:self.videoTime];
}

- (void) setData: (HomeRecommendVCData *)data {
    self.imageView.image = data.image;
    self.title.text = data.text;
}
@end


