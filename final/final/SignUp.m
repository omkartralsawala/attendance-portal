//
//  SignUp.m
//  final
//
//  Created by mavreick on 12/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import "SignUp.h"
#import "AppDelegate.h"
#import "UIViewController+Alerts.h"
#import "SWRevealViewController.h"
#import <Firebase/Firebase.h>
#import <objc/runtime.h>

@interface SignUp ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation SignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ref = [[FIRDatabase database] reference];
    _name.placeholder = @"Name";
    _prn.placeholder = @"PRN";
    _mailID.placeholder = @"@sitpune.edu.in";
    NSString *string = _mailID.text;
    if ([string rangeOfString:@"@sitpune.edu.in"].location == NSNotFound)
    {
        NSLog(@"please enter a symbiosis domain mail id");
    }
    _password.placeholder = @"password";
    _password.keyboardAppearance = UIKeyboardAppearanceDark;
    _password.returnKeyType = UIReturnKeyDone;
    _password.secureTextEntry = YES;
    
    _branch_text.placeholder = @"branch";
    _batch_text.placeholder = @"batch";
    
    _ConfirmPassword.placeholder = @"confirm password";
    _ConfirmPassword.keyboardAppearance=UIKeyboardAppearanceDark;
    _ConfirmPassword.returnKeyType=UIReturnKeyDone;
    _ConfirmPassword.secureTextEntry=YES;
    _backgroundImage.image=[UIImage imageNamed:@"red3.png"];
    
    _array = [NSArray arrayWithObjects:@"Computer Science",@"Information Technology",@"Civil",@"Electronics and Telecommunicaton",@"Mechanical",nil];
    
    _array1 = [NSArray arrayWithObjects:@"2014-18",@"2015-19", @"2016-20", @"2017-21", @"2018-22",nil];
    
    _batch_picker.delegate = self;
    _batch_picker.dataSource = self;
    _branch_picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43,100,220)];
    _branch_picker.delegate = self;
    _branch_picker.dataSource = self;
    [_branch_picker  setShowsSelectionIndicator:YES];
    _branch_text.inputView = _branch_picker ;
    _batch_text.inputView = _branch_picker ;
    
    _mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,100,20)];
    _mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [_mypickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [barItems addObject:doneBtn];
    [_mypickerToolbar setItems:barItems animated:YES];
    _batch_text.inputAccessoryView = _mypickerToolbar;
    _branch_text.inputAccessoryView = _mypickerToolbar;
    [self.view bringSubviewToFront:_password];
    [self.view bringSubviewToFront:_ConfirmPassword];
    [self.view bringSubviewToFront:_prn];
    [self.view bringSubviewToFront:_name];
    [self.view bringSubviewToFront:_mailID];
    [self.view bringSubviewToFront:_batch_text];
    [self.view bringSubviewToFront:_branch_text];
    [self.view bringSubviewToFront:_RegisterButtonClick];
}
-(void)pickerDoneClicked
{
    NSLog(@"Done Clicked");
    [_branch_text resignFirstResponder];
    _mypickerToolbar.hidden=YES;
    _branch_picker.hidden=YES;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(_branch_text.isEditing)
    {
        return [_array count];
    }
    if(_batch_text.isEditing)
    {
        return [_array1 count];
    }
    return 0;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(_branch_text.isEditing)
    {
        return [_array objectAtIndex:row];
    }
    if(_batch_text.isEditing)
    {
        return [_array1 objectAtIndex:row];
    }
    return 0;
}
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(_branch_text.isEditing)
    {
        _branch_text.text = [_array objectAtIndex:row];
    }
    if(_batch_text.isEditing)
    {
        _batch_text.text =[_array1 objectAtIndex:row];
    }
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
- (IBAction)RegisterButtonClick:(id)sender
{
    BOOL flag = true;
    NSString *string = _mailID.text;
    if ([string rangeOfString:@"@sitpune.edu.in"].location == NSNotFound)
    {
        flag = false;
        NSString* message =@"enter a symbiosis domain mail id";
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message: message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                             {
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    if(_password.text == _ConfirmPassword.text)
    {
        _FinalPassword=_ConfirmPassword.text;
    }
    else
    {
        flag = false;
        NSString* message =@"incorrect password";
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message: message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                             {
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    if(flag==true)
    {
        [[FIRAuth auth] createUserWithEmail:_mailID.text password:_FinalPassword
                                 completion:^(FIRAuthDataResult * _Nullable authResult,
                                              NSError * _Nullable error) {
                                     
                                     if (error == nil) {
                                         NSString *localUser = authResult.user.uid;
                                         
                                         [[[self.ref child:@"students"]child:localUser]setValue:@{@"Name": self.name.text,@"Prn":self.prn.text,@"Mail": self.mailID.text,@"Branch": self.branch_text.text,@"Batch": self.batch_text.text}];
                                         
                                         UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                         SWRevealViewController *sw = [sb instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
                                         AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
                                         appDelegate.window.rootViewController = sw;
                                         
                                     }
                                     else
                                     {
                                         if (error != nil)
                                         {
                                             NSLog(@"%@",error);
                                         }
                                     }
                                 }];
        
    }
}
@end
