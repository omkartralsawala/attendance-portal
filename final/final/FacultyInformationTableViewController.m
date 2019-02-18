//
//  FacultyInformationTableViewController.m
//  final
//
//  Created by mavreick on 27/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import "FacultyInformationTableViewController.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
#import "FacultyInfoTableViewCell.h"
#import <Firebase/Firebase.h>

@interface FacultyInformationTableViewController ()
@property (strong, nonatomic ) FIRDatabaseReference *facultyRef;
@end

@implementation FacultyInformationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _facultyRef = [[FIRDatabase database]reference];
    UIBarButtonItem *menu = [[UIBarButtonItem alloc]init];
    menu.title=@":::";
    menu.target = self.revealViewController;
    menu.action = @selector(revealToggle:);
    self.navigationItem.leftBarButtonItem = menu;
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [[_facultyRef child:@"faculty"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        self.postDict = snapshot.value;
        NSLog(@"%@",self.postDict);
        [self.tableView reloadData];
    }];
    
     [self.tableView registerNib:[UINib nibWithNibName:@"FacultyInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _postDict.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FacultyInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary * faculty  = [_postDict objectAtIndex:indexPath.row];
    
    cell.namelbl.text = [faculty valueForKey:@"Name"];
    cell.deptlbl.text = [faculty valueForKey:@"Dept Name"];
    cell.designaationlbl.text = [faculty valueForKey:@"Designation"];
    cell.mail.text = [faculty valueForKey:@"Mail"];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
