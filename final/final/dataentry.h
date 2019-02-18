//
//  dataentry.h
//  final
//
//  Created by mavreick on 26/05/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataentry : NSObject
{
    long int *contact_no;
    int semester;
}
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *password;
@property(strong,nonatomic)NSString *department;
@property(weak,nonatomic)NSString *academic_year;
@property(strong,nonatomic)NSString *mail_ID;
@end
