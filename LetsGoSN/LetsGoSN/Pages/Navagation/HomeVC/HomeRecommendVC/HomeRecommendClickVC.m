//
//  HomeRecommendClickVC.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/11/4.
//

#import "HomeRecommendClickVC.h"

@interface HomeRecommendClickVC ()

@end

@implementation HomeRecommendClickVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void) initView {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    int width = self.view.bounds.size.width;
    int height = self.view.bounds.size.height;
    int imageViewSize = width;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (height - imageViewSize) / 2, imageViewSize, imageViewSize)];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, height * 3 / 4 , width, 100)];
    self.label.text = @"法国士兵";
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.label];
}

- (void) setImage: (UIImage*) image AndText: (NSString *) text {
    if (self.imageView != nil) {
        self.imageView.image = image;
    }
    if (self.label != nil) {
        self.label.text = text;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
