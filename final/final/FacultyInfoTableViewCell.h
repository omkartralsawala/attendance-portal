//
//  FacultyInfoTableViewCell.h
//  final
//
//  Created by mavreick on 27/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FacultyInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *namelbl;

@property (weak, nonatomic) IBOutlet UILabel *deptlbl;

@property (weak, nonatomic) IBOutlet UILabel *designaationlbl;

@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (strong, nonatomic) IBOutlet UILabel *mail;
@end

NS_ASSUME_NONNULL_END
