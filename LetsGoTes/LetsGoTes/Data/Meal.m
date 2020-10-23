//
//  Meal.m
//  LetsGoTes
//
//  Created by sherlock1017 on 2020/10/23.
//

#import "Meal.h"

@implementation Meal
- (void)initWithName:(NSString *)name andImage:(UIImage *)image andRating:(int)rating {
    if (!name || rating < 0) {
        return;
    }
    self.name = name;
    self.image = image;
    self.rating = rating;
}

@end
