//
//  SFUserCenterViewModel.m
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFUserCenterViewModel.h"
#import "SFUserHeaderModel.h"
#import "SFUserCenterModel.h"
#import <SFComponent/SFInjection.h>

@implementation SFUserCenterViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createUserHeaderModel];
        [self createUserCenterModels];
    }
    return self;
}

- (void)createUserHeaderModel {
    _userHeaderModel = [[SFUserHeaderModel alloc] init];
    _userHeaderModel.backgroundImage = nil;
    _userHeaderModel.name = nil;
    _userHeaderModel.headerURL = nil;
}

- (void)createUserCenterModels {
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
    NSArray *params = [[SFInjection sharedInstance] fetchInjectionParamsWithIdentifier:Injection_SFUserCenter_Identifier];
    
    for (NSDictionary *param in params) {
        SFUserCenterModel *userCenterModel = [[SFUserCenterModel alloc] initWithDictionary:param];
        
        [models addObject:userCenterModel];
    }
    
    [self addUserCenterModels:models];
}

- (void)addUserCenterModels:(NSArray<SFUserCenterModel *> *)models {
    if (!models || models.count == 0) {
        return;
    }
    NSMutableArray *userCenterModels = _userCenterModels ? [_userCenterModels mutableCopy] : [[NSMutableArray alloc] init];
    [userCenterModels addObjectsFromArray:models];
    _userCenterModels = userCenterModels;
}

@end
