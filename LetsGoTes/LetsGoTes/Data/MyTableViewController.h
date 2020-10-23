//
//  MyTableViewController.h
//  LetsGoTes
//
//  Created by 花泽真菜 on 2020/10/23.
//

#import <UIKit/UIKit.h>
#import "Meal.h"
#import "MyTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewController : UITableViewController
@property (nonatomic) NSMutableArray* mealList;

- (void) loadMealData;
@end

NS_ASSUME_NONNULL_END
