//
//  AcademicCalender.m
//  final
//
//  Created by mavreick on 19/06/18.
//  Copyright © 2018 felix-its. All rights reserved.
//

#import "AppDelegate.h"
#import "AcademicCalender.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
#import <PDFKit/PDFKit.h>
@interface AcademicCalender ()

@end

@implementation AcademicCalender



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menu.target = self.revealViewController;
    _menu.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    PDFView *View = [[PDFView alloc] initWithFrame: self.view.bounds];
    View.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    View.autoScales = NO ;
    View.displayDirection = kPDFDisplayDirectionHorizontal;
    View.displayMode = kPDFDisplaySinglePageContinuous;
    View.displaysRTL = YES ;
    [View setDisplaysPageBreaks:YES];
    [View setDisplayBox:kPDFDisplayBoxTrimBox];
    [View zoomIn:self];
    [self.view addSubview:View];
    
    NSURL * URL = [[NSBundle mainBundle] URLForResource: @"AcademicCalender" withExtension: @ "pdf" ];
    PDFDocument * document = [[PDFDocument alloc] initWithURL: URL];
    View.document = document;
    
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
