//
//  MyViewController.h
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/10/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyViewController : UIViewController
- (void) initBackButton;
- (void) changeCurrentVC:(id)newVC;
- (void) removeCurrentView;
- (void) addCurrentView;
@end

NS_ASSUME_NONNULL_END
