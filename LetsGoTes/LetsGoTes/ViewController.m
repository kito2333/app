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
- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
    UIImagePickerController *imgController = [[UIImagePickerController alloc] init];
    imgController.delegate = self;
    imgController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController: imgController
                         animated: YES completion: nil];
}

- (IBAction)setDefaultText:(UIButton *)sender {
    self.label.text = @"2233";
}

//MARK: UIImagePickerControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // dismiss the picker if the user canceled
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSString* type = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"ZZC: %@", type);
    self.image.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
@end
