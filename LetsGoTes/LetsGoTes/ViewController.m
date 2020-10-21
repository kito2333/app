//
//  ViewController.m
//  LetsGoTes
//
//  Created by 花泽真菜 on 2020/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
}

//MARK: UITestFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.label.text = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Hide the keyboard
    [textField resignFirstResponder];
    return TRUE;
}

//MARK: ACTIONS
- (IBAction)setDefaultText:(UIButton *)sender {
    self.label.text = @"2233";
}
@end
