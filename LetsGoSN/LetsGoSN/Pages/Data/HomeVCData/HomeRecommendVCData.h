//
//  HomeRecommendVCData.h
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeRecommendVCData : NSObject

@property (nonatomic) UIImage* image;
@property (nonatomic) NSString* text;

- (instancetype) initWithImage: (UIImage *) image andText: (NSString *) text;
@end

NS_ASSUME_NONNULL_END
