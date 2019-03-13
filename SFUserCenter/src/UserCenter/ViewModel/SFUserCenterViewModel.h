//
//  SFUserCenterViewModel.h
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define Injection_SFUserCenter_Identifier @"Injection_SFUserCenter"

@class SFUserHeaderModel;
@class SFUserCenterModel;

@interface SFUserCenterViewModel : NSObject

@property (nonatomic, strong, readonly) SFUserHeaderModel *__nullable userHeaderModel;

@property (nonatomic, strong, readonly) NSArray<SFUserCenterModel *> *__nullable userCenterModels;

- (void)addUserCenterModels:(NSArray<SFUserCenterModel *> *__nullable)models;

@end

NS_ASSUME_NONNULL_END
