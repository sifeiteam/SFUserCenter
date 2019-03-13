//
//  SFUserCenterViewController.m
//  SFUserCenter
//
//  Created by XJY on 2019/3/3.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFUserCenterViewController.h"
#import <SFComponent/SFLanguage.h>
#import <SFComponent/SFColors.h>
#import "SFUserCenter.h"
#import "SFUserCenterService.h"

@interface SFUserCenterViewController ()

@property (nonatomic, strong) SFUserCenterService *userCenterService;

@end

@implementation SFUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self createService];
}

- (void)setupUI {
    self.view.backgroundColor = SFColorWithNumber(1);
    
    self.navigationItem.title = [SFLanguage localizedStringWithKey:@"Title" componentName:[SFUserCenter componentName]];
}

- (void)createService {
    self.userCenterService = [[SFUserCenterService alloc] initWithTableView:self.tableView];
}

@end
