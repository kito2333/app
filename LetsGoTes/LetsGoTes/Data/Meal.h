//
//  Meal.h
//  LetsGoTes
//
//  Created by sherlock1017 on 2020/10/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Meal : NSObject
@property (nonatomic) NSString* name;
@property (nonatomic) UIImage* image;
@property (nonatomic) int rating;

- (void) initWithName: (NSString*) name
             andImage: (UIImage*) image
            andRating: (int) rating;
@end

NS_ASSUME_NONNULL_END
