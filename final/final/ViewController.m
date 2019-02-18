//
//  ViewController.m
//  SlideOutMenu
//
//  Created by Jared Davidson on 7/14/14.
//  Copyright (c) 2014 Archetapp. All rights reserved.
//

#import "ViewController.h"
#import "AttendanceViewController.h"
#import "FacultyInformationTableViewController.h"
#import "Notes.h"
#import "SWRevealViewController.h"
#import <Firebase/Firebase.h>

@interface ViewController ()
@property (strong, nonatomic ) FIRDatabaseReference *studentRef;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *userID=[FIRAuth auth].currentUser.uid;
    _studentRef = [[FIRDatabase database]reference];
    
    NSLog(@"%@",_studentRef.ref);
    [[[_studentRef child:@"student"]child:userID] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary *postDict = snapshot.value;
        NSLog(@"%@",postDict);
        
        self.StudentName.text = [postDict objectForKey:@"Name"];
        self.academicYear.text = [postDict objectForKey:@"Batch"];
        self.mailID.text = [postDict objectForKey:@"Mail"];
        self.Prn.text = [postDict objectForKey:@"PRN"];
        [self.BranchButton setTitle:[postDict objectForKey:@"Branch"] forState:UIControlStateNormal];
        
    }];
    
    
    
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.profileImageView.layer.cornerRadius =self.profileImageView.frame.size.width / 2;
    self.profileImageView.clipsToBounds = YES;
    
    
    self.profileImageView.layer.borderWidth = 3.0f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
//    _topBackgroundImage.image=[UIImage imageNamed:@"red4.2.PNG"];

    [_BranchButton.layer setBorderWidth:1.5];
    [_BranchButton.layer setBorderColor:[[UIColor colorWithRed:176.0f/255.0f green:38.0f/255.0f blue:33.0f/255.0f alpha:1.0] CGColor]];
    
    [_SemesterButton.layer setBorderWidth:1.5];
    [_SemesterButton.layer setBorderColor:[[UIColor colorWithRed:176.0f/255.0f green:38.0f/255.0f blue:33.0f/255.0f alpha:1.0] CGColor]];
    
    [_attendanceButton.layer setBorderWidth:1.5];
    [_attendanceButton.layer setBorderColor:[[UIColor colorWithRed:176.0f/255.0f green:38.0f/255.0f blue:33.0f/255.0f alpha:1.0] CGColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"red5.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    
    [self.view bringSubviewToFront:_StudentName];
    [self.view addSubview:_topBackgroundImage];
    [self.view bringSubviewToFront:_profileImageView];
    [self.view bringSubviewToFront:_Prn];
    [self.view bringSubviewToFront:_StudentName];
    [self.view bringSubviewToFront:_academicYear];
    [self.view bringSubviewToFront:_BranchButton];
    [self.view bringSubviewToFront:_SemesterButton];
    [self.view bringSubviewToFront:_attendanceButton];
    [self.view bringSubviewToFront:_mailID];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)attendanceButtonClicked:(id)sender {
    AttendanceViewController *att=[self.storyboard instantiateViewControllerWithIdentifier:@"attendance"];
    [self.navigationController pushViewController:att animated:YES];
}

- (IBAction)SemesterButtonClicked:(id)sender {
    Notes *not=[self.storyboard instantiateViewControllerWithIdentifier:@"notes"];
    [self.navigationController pushViewController:not animated:YES];
}

- (IBAction)BranchButtonClicked:(id)sender {
    FacultyInformationTableViewController *fac=[self.storyboard instantiateViewControllerWithIdentifier:@"facultyinfo"];
    [self.navigationController pushViewController:fac animated:YES];
}
@end
