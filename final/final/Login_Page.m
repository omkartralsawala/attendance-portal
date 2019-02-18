//
//  Login_Page.m
//  final
//
//  Created by mavreick on 11/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import "Login_Page.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "UIViewController+Alerts.h"
#import "SignUp.h"
#import "SWRevealViewController.h"

@interface Login_Page ()

@end

@implementation Login_Page

- (void)viewDidLoad {
    [super viewDidLoad];
    _mailID.placeholder=@"email id";
    _mailID.returnKeyType=UIReturnKeyNext;
    
    _password.placeholder=@"password";
    _password.keyboardAppearance=UIKeyboardAppearanceDark;
    _password.returnKeyType=UIReturnKeyDone;
    _password.secureTextEntry=YES;
    [_logininButton setTitle:@"login" forState:UIControlStateNormal];
    [_logininButton setTitle:@"logining in" forState:UIControlStateHighlighted];
    _backgroundImage.image=[UIImage imageNamed:@"red3.png"];
    [self.view bringSubviewToFront:_password];
    [self.view bringSubviewToFront:_logininButton];
    [self.view bringSubviewToFront:_SignUpButton];
    [self.view bringSubviewToFront:_mailID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // done button was pressed - dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginButtonClick:(id)sender
{
    [[FIRAuth auth] signInWithEmail:self->_mailID.text
                           password:self->_password.text
                         completion:^(FIRAuthDataResult * _Nullable authResult,
                                      NSError * _Nullable error) {

                             if (error == nil) {
                                 UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                 SWRevealViewController *sw = [sb instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
                                 AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
                                 appDelegate.window.rootViewController = sw;
                             } else {
                                 NSLog(@"%@",error.localizedDescription);
                             }
                         }];
}
-(IBAction)SignUpButtonClick:(id)sender
{
    SignUp *sp=[[SignUp alloc]init];
    [self.navigationController pushViewController:sp animated:YES];
}
@end
