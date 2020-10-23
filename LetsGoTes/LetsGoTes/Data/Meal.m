//
//  Meal.m
//  LetsGoTes
//
//  Created by sherlock1017 on 2020/10/23.
//

#import "Meal.h"

@implementation Meal
- (instancetype)initWithName:(NSString *)name andImage:(UIImage *)image andRating:(int)rating {
    if (name == nil || rating < 0) {
        return nil;
    }
    self.name = name;
    self.image = image;
    self.rating = rating;
    return self;
}

@end
