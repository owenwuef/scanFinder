//
//  TodayViewController.m
//  scanFindToday
//
//  Created by OwenWu on 10/6/15.
//  Copyright (c) 2015 owen. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIButton *btnTest;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //使用preferredContentSize设置大小 且只用设置高度就好了
    self.preferredContentSize = CGSizeMake(0, 200);
    
//    __weak __typeof(&*self)ws = self;
    
    self.contentView = [UIView new];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentView];
    
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(ws.view);
//    }];
    
    self.btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnTest setTitle:[[NSDate date] description] forState:UIControlStateNormal];
    self.btnTest.backgroundColor = [UIColor redColor];
    [self.btnTest addTarget:self action:@selector(actionTest) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.btnTest];
    
//    [self.btnTest mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(ws.contentView);
//        make.size.mas_equalTo(CGSizeMake(300, 40));
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
}


- (void) actionTest
{
    self.preferredContentSize = CGSizeMake(0, self.contentView.frame.size.height>250?200:300);
}


@end
