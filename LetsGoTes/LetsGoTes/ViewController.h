//
//  ViewController.h
//  LetsGoTes
//
//  Created by 花泽真菜 on 2020/10/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;


- (IBAction)setDefaultText:(UIButton *)sender;

@end

