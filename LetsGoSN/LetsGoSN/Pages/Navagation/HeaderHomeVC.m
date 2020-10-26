//
//  HeaderHomeVC.m
//  LetsGoSN
//
//  Created by 花泽真菜 on 2020/10/26.
//

#import "HeaderHomeVC.h"

@interface HeaderHomeVC ()

@end

@implementation HeaderHomeVC

//MARK: init
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void) initView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Show Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"What we fight for";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
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
