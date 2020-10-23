//
//  ViewController.h
//  LetsGoTes
//
//  Created by 花泽真菜 on 2020/10/21.
//

#import <UIKit/UIKit.h>
#import "RatingStar.h"

@interface ViewController : UIViewController
    <UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet RatingStar *ratingStar;

- (IBAction)setDefaultText:(UIButton *)sender;

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender;

@end

