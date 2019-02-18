//
//  AttendanceTableViewCell.h
//  final
//
//  Created by mavreick on 11/07/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AttendanceTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *SubjectName;
@property (strong, nonatomic) IBOutlet UILabel *Present;
@property (strong, nonatomic) IBOutlet UILabel *totalLectures;
@property (strong, nonatomic) IBOutlet UILabel *Attendance;

@end

NS_ASSUME_NONNULL_END
