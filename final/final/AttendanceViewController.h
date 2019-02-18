//
//  AttendanceViewController.h
//  final
//
//  Created by mavreick on 28/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AttendanceViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    float attendanceValue;
    float avgAttendance;
    float avgAttendanceValue;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSArray *postDict;
@end

NS_ASSUME_NONNULL_END
