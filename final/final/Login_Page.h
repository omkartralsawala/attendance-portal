//
//  Login_Page.h
//  final
//
//  Created by mavreick on 11/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuth/FIRAuth.h>
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface Login_Page : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UITextField *mailID;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)loginButtonClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *logininButton;
@property(strong,nonatomic)UINavigationController *nav;
@property (strong, nonatomic) IBOutlet UIButton *SignUpButton;
- (IBAction)SignUpButtonClick:(id)sender;
@end

NS_ASSUME_NONNULL_END
