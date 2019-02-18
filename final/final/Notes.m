//
//  Notes.m
//  final
//
//  Created by mavreick on 19/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import "Notes.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
@interface Notes ()
{
    
}

@end
@implementation Notes

- (void)viewDidLoad {
    [super viewDidLoad];
    _menu.target = self.revealViewController;
    _menu.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
   
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
