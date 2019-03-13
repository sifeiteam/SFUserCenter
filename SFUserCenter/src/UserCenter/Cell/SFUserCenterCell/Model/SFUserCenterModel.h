//
//  SFUserCenterModel.h
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFUserCenterModel : NSObject

@property (nonatomic, strong) UIImage *__nullable icon;

@property (nonatomic, copy) NSString *__nullable title;

@property (nonatomic, copy) NSString *__nullable componentName;

@property (nonatomic, copy) NSString *__nullable eventName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
