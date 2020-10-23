//
//  MyTableViewCell.h
//  LetsGoTes
//
//  Created by 花泽真菜 on 2020/10/23.
//

#import <UIKit/UIKit.h>
#import "RatingStar.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel* label;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet RatingStar *ratingStar;
@end

NS_ASSUME_NONNULL_END
