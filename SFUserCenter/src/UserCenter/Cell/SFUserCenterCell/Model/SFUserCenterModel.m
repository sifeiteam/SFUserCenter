//
//  SFUserCenterModel.m
//  SFUserCenter
//
//  Created by XJY on 2019/3/13.
//  Copyright © 2019 com.sf.ios. All rights reserved.
//

#import "SFUserCenterModel.h"

@implementation SFUserCenterModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.icon = [dictionary objectForKey:@"icon"];
        self.title = [dictionary objectForKey:@"title"];
        self.componentName = [dictionary objectForKey:@"componentName"];
        self.eventName = [dictionary objectForKey:@"eventName"];
    }
    return self;
}

@end
