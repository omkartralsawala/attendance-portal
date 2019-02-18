//
//  SignUp.h
//  final
//
//  Created by mavreick on 12/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuth/FIRAuth.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignUp : UIViewController
@property (strong,nonatomic)IBOutlet UITextField *name;
@property (strong,nonatomic)IBOutlet UITextField *prn;
@property (strong,nonatomic)IBOutlet UITextField *mailID;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong,nonatomic)IBOutlet UITextField *branch_text;
@property (strong, nonatomic) IBOutlet UITextField *batch_text;
@property (strong,nonatomic)IBOutlet UIPickerView *branch_picker;
@property (strong,nonatomic)IBOutlet UIPickerView *batch_picker;
@property (strong,nonatomic)IBOutlet UITextField *password;
@property (strong,nonatomic)IBOutlet UITextField *ConfirmPassword;
@property (strong,nonatomic)NSString *FinalPassword;
@property (strong,nonatomic)IBOutlet UIButton *RegisterButtonClick;
@property (strong,retain)NSArray *array;
@property (strong,retain)NSArray *array1;
@property (strong,nonatomic)UIToolbar *mypickerToolbar;
- (IBAction)RegisterButtonClick:(id)sender;

@end

NS_ASSUME_NONNULL_END
