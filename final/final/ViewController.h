//
//  ViewController.h
//  SlideOutMenu
//
//  Created by Jared Davidson on 7/14/14.
//  Copyright (c) 2014 Archetapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int permanentRegistrationNumber;
    int semester;
    int attendance;
}
@property (strong,nonatomic)NSString *name;
@property (strong,nonatomic)NSString *mail;
@property (strong,nonatomic)NSString *branch;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UIImageView *topBackgroundImage;
@property (strong, nonatomic) IBOutlet UINavigationItem *pageTitle;
@property (strong, nonatomic) IBOutlet UILabel *Prn;
@property (strong, nonatomic) IBOutlet UILabel *academicYear;
@property (strong, nonatomic) IBOutlet UIButton *BranchButton;
@property (strong, nonatomic) IBOutlet UIButton *SemesterButton;
@property (strong, nonatomic) IBOutlet UIButton *attendanceButton;
@property (strong, nonatomic) IBOutlet UILabel *mailID;
@property (strong, nonatomic) IBOutlet UIImageView *downBackgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *StudentName;
@property (strong, nonatomic) IBOutlet UILabel *timeTable1;
@property (strong, nonatomic) IBOutlet UILabel *timeTable2;
- (IBAction)attendanceButtonClicked:(id)sender;
- (IBAction)SemesterButtonClicked:(id)sender;
- (IBAction)BranchButtonClicked:(id)sender;
- (void)timetable;
@property NSInteger *weekday;
@property (strong, nonatomic)NSString *currentTime;

@end
