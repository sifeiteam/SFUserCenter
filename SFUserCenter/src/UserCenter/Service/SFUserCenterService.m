//
//  SFUserCenterService.m
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFUserCenterService.h"
#import "SFUserCenterViewModel.h"
#import "SFUserHeaderCell.h"
#import "SFUserCenterCell.h"
#import "SFUserHeaderModel.h"
#import "SFUserCenterModel.h"
#import <SFComponent/SFInjection.h>
#import <SFComponent/SFEventCenter.h>
#import <SFComponent/UIView+SFContext.h>

@interface SFUserCenterService () <UITableViewDataSource, UITableViewDelegate, SFInjectionProtocol>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) SFUserCenterViewModel *userCenterViewModel;

@end

@implementation SFUserCenterService

- (void)dealloc {
    [[SFInjection sharedInstance] removeDelegate:self identifier:Injection_SFUserCenter_Identifier];
}

- (instancetype)initWithTableView:(UITableView * _Nonnull __weak)tableView {
    self = [super init];
    if (self) {
        self.tableView = tableView;
        
        [self addObserver];
        [self createViewModel];
        [self setupTableView];
    }
    return self;
}

- (void)addObserver {
    [[SFInjection sharedInstance] addDelegate:self identifier:Injection_SFUserCenter_Identifier];
}

- (void)createViewModel {
    self.userCenterViewModel = [[SFUserCenterViewModel alloc] init];
}

- (void)setupTableView {
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    Class SFUserHeaderCellClass = [SFUserHeaderCell class];
    Class SFUserCenterCellClass = [SFUserCenterCell class];
    [self.tableView registerClass:SFUserHeaderCellClass forCellReuseIdentifier:NSStringFromClass(SFUserHeaderCellClass)];
    [self.tableView registerClass:SFUserCenterCellClass forCellReuseIdentifier:NSStringFromClass(SFUserCenterCellClass)];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.userCenterViewModel.userCenterModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SFUserHeaderCell *cell = (SFUserHeaderCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SFUserHeaderCell class]) forIndexPath:indexPath];
        cell.userHeaderModel = self.userCenterViewModel.userHeaderModel;
        return cell;
    }
    
    SFUserCenterCell *cell = (SFUserCenterCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SFUserCenterCell class]) forIndexPath:indexPath];
    cell.userCenterModel = [self.userCenterViewModel.userCenterModels objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        return;
    }
    SFUserCenterModel *model = [self.userCenterViewModel.userCenterModels objectAtIndex:indexPath.row];
    
    NSDictionary *context = nil;
    if (self.tableView.sf_controller) {
        context = @{@"SFUserCenterViewController" : self.tableView.sf_controller};
    }
    
    [SFEventCenter sendEvent:model.eventName componentName:model.componentName context:context];
}

#pragma mark - SFInjectionProtocol

- (void)observeInjectionWithIdentifier:(NSString *)identifier params:(NSDictionary *)params {
    SFUserCenterModel *userCenterModel = [[SFUserCenterModel alloc] initWithDictionary:params];
    [self.userCenterViewModel addUserCenterModels:@[userCenterModel]];
    
    [self.tableView reloadData];
}

@end
