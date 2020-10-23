//
//  RatingStar.h
//  LetsGoTes
//
//  Created by sherlock1017 on 2020/10/22.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
NS_ASSUME_NONNULL_BEGIN

@interface RatingStar : UIStackView {
    NSMutableArray* _buttonList;
}
@property (nonatomic)int rating;
@property (nonatomic ,assign)IBInspectable CGSize starSize;
@property (nonatomic, assign)IBInspectable int starCount;

- (void) setupButtons;

- (void) updateButtons;

- (void) ratingButtons: (UIButton*) btn;
@end

NS_ASSUME_NONNULL_END
