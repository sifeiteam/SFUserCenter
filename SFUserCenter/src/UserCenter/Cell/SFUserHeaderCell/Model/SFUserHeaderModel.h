//
//  SFUserHeaderModel.h
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFUserHeaderModel : NSObject

@property (nonatomic, strong) UIImage *__nullable backgroundImage;

@property (nonatomic, copy) NSString *__nullable name;

@property (nonatomic, copy) NSString *__nullable headerURL;

@end

NS_ASSUME_NONNULL_END
