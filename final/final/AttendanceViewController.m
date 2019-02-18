//
//  AttendanceViewController.m
//  final
//
//  Created by mavreick on 28/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import "AttendanceViewController.h"
#import "AttendanceTableViewCell.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
#import "PNChart.h"
#import <Firebase/Firebase.h>

@interface AttendanceViewController ()
@property (strong, nonatomic) FIRDatabaseReference *attendanceRef;
@property (strong, nonatomic) PNCircleChart * circleChart;

@end

@implementation AttendanceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _attendanceRef = [[FIRDatabase database]reference];
    NSString *userID=[FIRAuth auth].currentUser.uid;
    UIBarButtonItem *menu = [[UIBarButtonItem alloc]init];
    menu.title = @":::";
    menu.target = self.revealViewController;
    menu.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

   [[[_attendanceRef child:@"attendance"]child:userID] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        self.postDict = snapshot.value;
        NSLog(@"%@",self.postDict);
       
       [self getAtt];
    }];
  
    
    
    
    self.navigationItem.leftBarButtonItem = menu;

}

- (void)getAtt {
    for(int i=0; i<_postDict.count;i++)
    {
        NSDictionary *attendance = [_postDict objectAtIndex:i];
        float present = [[attendance valueForKey:@"Present"]integerValue];
        float lectures = [[attendance valueForKey:@"Total lectures"]integerValue];
        attendanceValue = (present/lectures)*100;

        avgAttendance = (avgAttendance+attendanceValue);
        NSLog(@"    %0.2f",avgAttendance);
    }
    avgAttendanceValue = avgAttendance/_postDict.count;
    NSLog(@"%0.2f" ,avgAttendanceValue);
    
    self.circleChart = [[PNCircleChart alloc]initWithFrame:CGRectMake(0, 80.0, SCREEN_WIDTH, 200.0) total:[NSNumber numberWithInt:100] current:[NSNumber numberWithFloat:avgAttendanceValue]  clockwise:true ];
    
    self.circleChart.backgroundColor = [UIColor clearColor];
    [self.circleChart setStrokeColor:PNGreen];
    [self.circleChart strokeChart];
    [self.view addSubview:self.circleChart];
    [self.view layoutIfNeeded];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _postDict.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"cellforrow");
    AttendanceTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *attendance = [_postDict objectAtIndex:indexPath.row];
    
    NSLog(@"%@",[attendance valueForKey:@"Subject"]);
    NSLog(@"%@",[attendance valueForKey:@"Present"]);
    NSLog(@"%@",[attendance valueForKey:@"Total lectures"]);
    float present = [[attendance valueForKey:@"Present"]integerValue];
    float lectures = [[attendance valueForKey:@"Total lectures"]integerValue];
    NSLog(@"%0.2f",present);
    NSLog(@"%0.2f",lectures);
    attendanceValue = (present/lectures)*100;
    NSLog(@"%0.2f",attendanceValue);
    
    cell.SubjectName.text = [attendance valueForKey:@"Subject"];
    cell.Present.text = [attendance valueForKey:@"Present"];
    cell.totalLectures.text = [attendance valueForKey:@"Total lectures"];
//    NSInteger *attendanceValue = (([attendance valueForKey:@"present"]/[attendance valueForKey:@"total lectures"])*100);
    cell.Attendance.text =[NSString stringWithFormat:@"%0.2f %", attendanceValue];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


@end
